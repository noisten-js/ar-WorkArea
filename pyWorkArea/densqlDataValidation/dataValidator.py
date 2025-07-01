import csv
import pyodbc
import datetime
import hashlib
import struct
from dataclasses import dataclass
from decimal import Decimal


@dataclass
class dbSvr:
    server_name: str
    db_name: str
    context: str = __name__


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


def validate_obj_name(obj_name: str, cn: pyodbc.Connection, ignore_columns: list):
    sql = (
        "SELECT\n"
        "   obj_name = concat(quotename(object_schema_name(object_id)), '.', quotename(name))\n"
        "FROM\n"
        "   sys.objects\n"
        "WHERE 1=1\n"
        "   AND object_id = object_id(?)\n"
        "   AND type in ('U', 'V')\n"
    )
    with cn.cursor() as cr:
        data = cr.execute(sql, [obj_name]).fetchall()
        if data:
            obj_name = data[0].obj_name
        else:
            raise ValueError(f"No table or view found matching the specified new_obj_name ({obj_name})")

        sql = (
            "SELECT\n"
            "    column_name = quotename(t0.name)\n"
            "   ,select_name = t0.name\n"
            "FROM\n"
            "   sys.columns t0\n"
            "WHERE 1=1\n"
            "   AND object_id = object_id(?)"
        )
        data = cr.execute(sql, [obj_name]).fetchall()
        column_list = [r.column_name for r in data if r.select_name not in ignore_columns]

    return obj_name, column_list


def validate_data(
        svr_new: dbSvr,
        srv_orig: dbSvr,
        obj_name_new: str,
        obj_name_orig: str,
        ignore_columns: list,
        output_path: str,
        batch_size: int
):
    # ------------------------------------------------------------------------------
    #   Connect to databases
    # ------------------------------------------------------------------------------
    # new
    new_cn = db_connect(
        server=svr_new.server_name,
        database=svr_new.db_name,
        context='enertia_rev_inquiry_data_validation_new'
    )
    new_cr = new_cn.cursor()

    # original
    orig_cn = db_connect(
        server=srv_orig.server_name,
        database=srv_orig.db_name,
        context='enertia_rev_inquiry_data_validation_new'
    )
    orig_cr = orig_cn.cursor()

    # ------------------------------------------------------------------------------
    #   Get object names from sys.objects (defense for sqlinjection)
    # ------------------------------------------------------------------------------
    # new
    obj_name_new, column_list_new = validate_obj_name(
        obj_name_new,
        new_cn,
        ignore_columns=ignore_columns
    )

    # original
    obj_name_orig, column_list_orig = validate_obj_name(
        obj_name_orig,
        orig_cn,
        ignore_columns=ignore_columns
    )
    common_columns = [c for c in list(set(column_list_new).intersection(column_list_orig))]
    common_columns.sort()
    common_columns.append('_rowhash')

    new_sql = f"SELECT {','.join(common_columns[0:-1])} FROM {obj_name_new}"
    orig_sql = f"SELECT {','.join(common_columns[0:-1])} FROM {obj_name_orig}"

    print(f'{datetime.datetime.now()} | INFO | Executing query for {obj_name_new}')
    new_cr.execute(new_sql)

    new_hash = {}
    batch_count = 0
    while True:
        batch_count += 1
        print(f'{datetime.datetime.now()} | INFO | Processing batch ( {batch_count} )')

        data = new_cr.fetchmany(batch_size)
        if not data:
            break

        for r in data:
            rdata = [r.__getattribute__(c[1:-1]) for c in common_columns[0:-1]]
            new_hash.update({hash_objects(rdata): 'found'})

    print(f'{datetime.datetime.now()} | INFO | Executing query for {obj_name_orig}')
    orig_cr.execute(orig_sql)

    with open(output_path, mode='w', newline='') as f:
        csv_writer = csv.writer(f, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
        csv_writer.writerow(common_columns)

    batch_count = 0
    while True:
        batch_count += 1
        print(f'{datetime.datetime.now()} | INFO | Comparing data between new and original ( {batch_count} )')

        with open(output_path, mode='a', newline='') as f:
            csv_writer = csv.writer(f, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)

            data = orig_cr.fetchmany(batch_size)
            if not data:
                break

            for r in data:
                rdata = [r.__getattribute__(c[1:-1]) for c in common_columns[0:-1]]
                rhash = hash_objects(rdata)
                rdata.append(rhash)

                print(f'{datetime.datetime.now()} | INFO | Searching for record: {rhash}', end='\r')
                if not new_hash.get(rhash):
                    csv_writer.writerow(rdata)
