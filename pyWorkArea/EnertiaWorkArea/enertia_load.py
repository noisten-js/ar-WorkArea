import pyodbc
import datetime
import hashlib
import struct
from decimal import Decimal


def to_bytes(obj: object):
    if obj is None:
        return b'\0'

    elif isinstance(obj, Decimal):
        return str(obj).encode('utf-8')

    elif isinstance(obj, int):
        return obj.to_bytes((obj.bit_length() + 8) // 8, byteorder='big', signed=True) or b'\0'

    elif isinstance(obj, float):
        return struct.pack('>d', obj)  # Convert float to 8-byte binary representation

    elif isinstance(obj, str):
        return obj.strip().encode('utf-8')

    elif isinstance(obj, bool):
        return b'\1' if obj else b'\0'

    elif isinstance(obj, bytes):
        return obj

    elif isinstance(obj, datetime.datetime) or isinstance(obj, datetime.date) or isinstance(obj, datetime.time):
        return obj.isoformat().encode('utf-8')

    elif isinstance(obj, list) or isinstance(obj, tuple) or isinstance(obj, set):
        return b''.join(to_bytes(x) for x in obj)

    elif isinstance(obj, dict):
        return b''.join(to_bytes(k) + to_bytes(v) for k, v in obj.items())

    elif isinstance(obj, complex):
        return struct.pack('>dd', obj.real, obj.imag)  # Convert real and imaginary parts to bytes

    else:
        raise ValueError(f"Unsupported type: {type(obj)}")


def hash_objects(obj_list: list):
    cbytes = b'|'.join([to_bytes(i) for i in obj_list])
    hbytes = hashlib.sha256(cbytes).hexdigest()
    return hbytes


def db_connect(
        server: str,
        database: str,
        login_name: str = None,
        password: str = None,
        context: str = 'enverus_sync',
        driver_ver: int = 17
):
    """
    desc:   Connects to a sql server database server using the specified credentials or Windows Integrated if no
            username and password specified

    params: server      network name, network alias, IPv4 or IPv6 network address of the SQL Server optionally
                        including the port

            database    Name of the database the connection will be made to. The user must have connect permissions
                        in the database specified.

            login_name  The login name of SQL Server Login configured on the server being connected to

            password    The password of the specified login.

            context     Is the name of the application connecting to SQL Server. This value is used in the APP
                        parameter of the connection string. This will be the value found in program_name in the
                        sys.dm_exec_sessions dynamic management view.

            driver_ver  The version of the driver to be used. This has only been tested with 13 and 17. The
                        default is 17.

    return: pyodbc.Connection

    notes:  If login_name or password are empty or set to None then the connection is established using Integrated
            Security set to True
    """
    database = 'master' if database is None or database == '' else database
    connection_string = f'DRIVER={{ODBC Driver {driver_ver} for SQL Server}};' \
                        f'SERVER={server};' \
                        f'DATABASE={database};' \
                        f'APP={context};'

    connection_string += 'Trusted_Connection=yes;' \
        if login_name is None or password is None or login_name == '' or password == '' \
        else f'UID={login_name};PWD={password}'

    return pyodbc.connect(connection_string)


def do_the_thing(batch_size: int = 1000000):
    batch_idx = 0

    src_server = 'testods01'
    src_db = 'EnertiaLive'
    src_schema = 'dbo'
    src_object = 'glMasDtl'
    src_cn = db_connect(src_server, src_db)
    src_cr = src_cn.cursor()

    dst_server = 'devdw01'
    dst_db = 'EDW_Stage'
    dst_schema = 'Stage'
    dst_object = 'Enertia_glMasDtl'
    dst_cn = db_connect(dst_server, dst_db)
    dst_cr = dst_cn.cursor()

    key_column = 'GlDtlTID'

    src_sql = (f"SELECT name FROM sys.columns WHERE object_id = object_id('{src_schema}.{src_object}') "
               f"AND name not in ('GlDtlTID') ORDER BY name")
    src_data = src_cr.execute(src_sql).fetchall()
    src_columns = [c[0] for c in src_data]

    src_sql = (
        f"SELECT "
        f"   RowHash=NULL,{','.join([c for c in src_columns])} "
        f"FROM "
        f"   {src_schema}.{src_object} "
        f"ORDER BY "
        f"   {key_column} "
        f"   OFFSET {batch_idx} ROWS "
        f"       FETCH NEXT {batch_size} ROWS ONLY"
    )

    src_data = src_cr.execute(src_sql).fetchall()

    return src_data


class EtlProcess:
    def __init__(self, etl_process_name: str, svr: str = 'denssis01', db: str = 'Edw_Integration_Framework', etl_hierarchy_path: str = None):
        self.etl_process_name = etl_process_name
        self.srv = svr
        self.db = db
        self.etl_hierarchy_path = f"{etl_hierarchy_path}|{etl_process_name}" if etl_hierarchy_path else etl_process_name

        print(self.etl_hierarchy_path)
        with db_connect(svr, db) as cn:
            cr = cn.cursor()
            sql = (
                "SELECT\n"
                "   t0.Etl_Process_Name\n"
                "FROM\n"
                "  dbo.Etl_Process t0\n"
                "  INNER JOIN dbo.Etl_Process_Dependency t1\n"
                "      ON t0.Etl_Process_Name = t1.Etl_Process_Name\n"
                "WHERE 1=1\n"
                "  AND t0.Is_Active = 1\n"
                "  AND t1.Dependent_On_Etl_Process_Name = ?\n"
            )
            data = cr.execute(sql, [etl_process_name]).fetchall()

        self.dependants = [EtlProcess(r.Etl_Process_Name, svr, db, etl_hierarchy_path=self.etl_hierarchy_path) for r in data]
        self.has_children = True if len(self.dependants) > 0 else False

    def __repr__(self):
        return self.etl_process_name


def get_etl_process_dependencies():
    cn = db_connect('denssis01', 'Edw_Integration_Framework')
    cr = cn.cursor()
    sql = (
        "WITH cteBase AS (\n"
        "   SELECT\n"
        "       t0.Etl_Process_Name\n"
        "      ,has_dependencies			= try_convert(BIT, (\n"
        "                                      SELECT\n"
        "                                           count(*)\n"
        "                                      FROM\n"
        "                                          dbo.Etl_Process_Dependency i0\n"
        "                                      WHERE 1=1\n"
        "                                          AND t0.Etl_Process_Name = i0.Etl_Process_Name\n"
        "                                    ))\n"
        "      ,is_dependency				= try_convert(BIT, (\n"
        "                                      SELECT\n"
        "                                          count(*) \n"
        "                                      FROM\n"
        "                                          dbo.Etl_Process_Dependency i0\n"
        "                                          INNER JOIN dbo.Etl_Process i1\n"
        "                                              ON i0.Dependent_On_Etl_Process_Name = i1.Etl_Process_Name \n"
        "                                              AND i1.Is_Active = 1\n"
        "                                      WHERE 1=1\n"
        "                                          AND t0.Etl_Process_Name = i0.Dependent_On_Etl_Process_Name\n"
        "                                    ))\n"
        "   FROM\n"
        "      dbo.Etl_Process t0\n"
        "   WHERE 1=1\n"
        "      AND t0.Is_Active = 1\n"
        ")\n"
        "SELECT\n"
        "   t0.Etl_Process_Name\n"
        "FROM\n"
        "   cteBase t0\n"
        "WHERE 1=1\n"
        "   AND t0.has_dependencies = 0\n"
        "   AND t0.is_dependency = 1\n"
        "ORDER BY\n"
        "   t0.Etl_Process_Name"
    )

    data = cr.execute(sql).fetchall()
    process_list = [EtlProcess(r.Etl_Process_Name) for r in data]

    return process_list


"""
from EnertiaWorkArea.enertia_load import db_connect, hash_objects
import datetime
sql = "SELECT * FROM dbo.rvBalOwnTxn"
cn = db_connect('denods01', 'EnertiaLive')
cr = cn.cursor()
cr.execute(sql)
dataH = []
while True:
    data = cr.fetchmany(100000)
    if data:
        for r in data:
            print(f'{datetime.datetime.now()} - {r.OwnTxnTID}', end='\r')
            dataH.append((r.OwnTxnTID, hash_objects(r)))
    else:
        break
"""