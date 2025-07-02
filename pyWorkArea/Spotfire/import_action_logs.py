import pyodbc
import datetime
import hashlib
import struct
import csv
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
        context: str = 'import_action_logs',
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


def import_action_logs(
        action_logs_path: str,
        # Parameter for how far back to load files from
        db_server: str,
        db_name: str,
        login_name: str = None,
        password: str = None,
        context: str = 'enverus_sync',
        driver_ver: int = 17
):
    # Connect to database
    cn = db_connect(db_server, db_name, login_name, password, context, driver_ver)
    sql = 'INSERT INTO dbo.action_logs VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)'
    cr = cn.cursor()

    # Open file for csv read
    with open(action_logs_path, mode='r', newline='', encoding='utf-8') as f:
        csv_reader = csv.reader(f, delimiter=';')
        csv_data = [r for r in csv_reader]

        return csv_data
        # cr.executemany(sql, [csv_data])
        # In batches of %, load file
            # for each row create a row hash (same datatype as expected in db)
                # Output rows whose hash is not found in db records hash
            # Save batch of data to database

    pass


def parse_action_log_row(action_log_row: list):
    typed_action_log_row = [
        datetime.datetime.fromisoformat(action_log_row[0]),
        str(action_log_row[1]),
        str(action_log_row[2]),
        datetime.datetime.fromisoformat(action_log_row[3]),
        str(action_log_row[4]),
        str(action_log_row[5]),
        str(action_log_row[6]),
        bool(action_log_row[7]),
        str(action_log_row[8]),
        str(action_log_row[9][:399]),
        str(action_log_row[10][:399]),
        str(action_log_row[11][:399]),
        str(action_log_row[12][:399]),
        str(action_log_row[13][:399]),
        str(action_log_row[14][:399]),
        str(action_log_row[15][:399]),
        str(action_log_row[16][:399])
    ]
    return typed_action_log_row
