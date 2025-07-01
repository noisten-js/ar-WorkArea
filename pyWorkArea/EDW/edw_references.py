import datetime
import os
import re
import pyodbc
import win32api
import zipfile
import openpyxl
from datetime import datetime as dt


host_name = win32api.GetComputerNameEx(3)
# Enerdeq_Download_Production_Monthly


class SqlServer:
    def __init__(self, server: str, databases: list[str] = None):
        self.server = server

        # Get SQL Server Version
        print(f"{dt.now()} | INFO | Loading {self.server}: Getting version info", end='\r')
        sql = "SELECT\n"
        sql += "  edition = convert(VARCHAR(128), serverproperty('Edition'))\n"
        sql += " ,version = convert(VARCHAR(128), serverproperty('ProductVersion'))\n"

        with db_connect(server=self.server, database='master') as cn:
            cr = cn.cursor()
            cr.execute(sql)
            data = cr.fetchall()

        self.edition = data[0].edition
        self.version = data[0].version

        # Get Databases
        print(f"{dt.now()} | INFO | Loading {self.server}: Loading databases", end='\r')

        with db_connect(server=self.server, database='master') as cn:
            if databases is None:
                sql = "SELECT name FROM sys.databases WHERE state = 0 ORDER BY name"
                cr = cn.cursor()
                cr.execute(sql)
            else:
                qstr = ','.join(['?' for _ in databases])
                sql = f"SELECT name FROM sys.databases WHERE state = 0 AND name in ({qstr})"
                cr = cn.cursor()
                cr.execute(sql, databases)

            self.databases = [SqlDatabase(server=self.server, database=row.name) for row in cr.fetchall()]

    def __str__(self):
        return f"{self.server} ({self.edition} v{self.version})"

    def get_database(self, database: str):
        try:
            return [db for db in self.databases if db.database.lower() == database.lower()][0]
        except Exception:
            return None


class SqlDatabase:
    def __init__(self, server: str = host_name, database: str = 'master'):
        self.server = server
        self.database = database

        # Get Database Objects
        print(f"{dt.now()} | INFO | Loading {self.server}: Loading databases: Loading objects ({self.database})",
              end='\r')

        sql = "SELECT\n"\
              "   object_id = object_id\n"\
              "  ,object_schema = object_schema_name(object_id)\n"\
              "  ,object_name = name\n"\
              "  ,object_type = type_desc\n"\
              "  ,object_definition     = CASE type\n"\
              "                             WHEN 'U' THEN ''\n"\
              "                             ELSE object_definition(object_id)\n"\
              "                           END\n"\
              "FROM sys.objects\n"\
              "WHERE 1=1\n"\
              "  AND type IN ('P', 'FN', 'TR', 'IF', 'TF', 'V', 'U')\n"\


        with db_connect(self.server, self.database) as cn:
            cr = cn.cursor()
            cr.execute(sql)
            self.sql_objects = [SqlObject(
                row.object_id,
                row.object_schema,
                row.object_name,
                row.object_type,
                row.object_definition
            ) for row in cr.fetchall()]

    def __str__(self):
        return f"{self.database} ({self.server})"


class SqlObject:
    def __init__(
            self,
            object_id: int,
            object_schema: str,
            object_name: str,
            object_type: str,
            object_definition: str
    ):
        self.object_id = object_id
        self.object_schema = object_schema
        self.object_name = object_name
        self.object_type = object_type
        self.object_definition = object_definition

        print(f"{dt.now()} | INFO | Loading object ({self.object_schema}.{self.object_name})"[0:149], end='\r')

        if object_definition is not None:
            # Strip comments from objet_definition
            raw_def = ''.join(re.split(r"/\*.*?\*/", object_definition, flags=re.DOTALL))
            raw_def = ''.join(re.split(r"--.*?($|\n)", raw_def))

            # Replace /t with four spaces
            raw_def = raw_def.replace('/t', '    ')

            self.sans_comments = raw_def

    def __str__(self):
        return f"{self.object_schema}.{self.object_name} (object_type={self.object_type})"

    def __gt__(self, other):
        return f'{self.object_schema}.{self.object_name}' > f'{other.object_schema}.{other.object_name}'

    def __lt__(self, other):
        return f'{self.object_schema}.{self.object_name}' < f'{other.object_schema}.{other.object_name}'


class SSISPackage:
    def __init__(self, package_name, package_xml):
        self.package_name = package_name
        self.package_xml = package_xml

    def __str__(self):
        return f'{self.package_name} (object_type=SSIS_PACKAGE)'


class SSISCollection:
    def __init__(
        self,
        ssis_path: str,
    ):
        self.ssis_path = ssis_path
        self.ssis_packages = []

        if self.ssis_path in [None, '']:
            self.ssis_packages = []
        elif os.path.exists(ssis_path) is False:
            self.ssis_packages = []
        else:
            for entry in os.walk(ssis_path):
                for file in entry[2]:
                    relpath = os.path.relpath(entry[0], ssis_path)

                    # Handle ispacs
                    if re.search(r'\.ispac$', file, flags=re.IGNORECASE):
                        with zipfile.ZipFile(os.path.join(entry[0], file)) as zip_file:
                            for zfile in zip_file.filelist:
                                if re.search(r'\.dtsx$', zfile.filename):
                                    with zip_file.open(zfile, mode='r') as dtsx_file:
                                        data = dtsx_file.read().decode('utf-8')

                                    self.ssis_packages.append(SSISPackage(
                                        package_name = os.path.join(relpath, os.path.basename(zip_file.filename), zfile.filename),
                                        package_xml = data
                                    ))

                    # Handle dtsx files
                    if re.search(r'\.dtsx$', file, flags=re.IGNORECASE):
                        with open(os.path.join(entry[0], file), mode='r', encoding='utf-8') as f:
                            data = f.read()

                        self.ssis_packages.append(SSISPackage(
                            package_name = os.path.join(relpath, file),
                            package_xml = data
                        ))

    def __str__(self):
        return self.ssis_path


def db_connect(server: str = host_name, database: str = 'master', login_name: str = None, password: str = None,
               context: str = 'js.utils'):
    """
    desc:   Connects to a sql server database server using the specified credentials or Windows Integrated if no
            username and password specified

    params: server      Server name, network alias, IPv4 or IPv6 network address of the SQL Server optionally
                        including the port

            database    Name of the database the connection will be made to. The user must have connect permissions
                        in the database specified.

            login_name  The login name of SQL Server Login configured on the server being connected to

            password    The password of the specified login.

            context     Is the name of the application connecting to SQL Server. This value is used in the APP
                        parameter of the connection string. This will be the value found in program_name in the
                        sys.dm_exec_sessions dynamic management view.

    return: pyodbc.Connection

    notes:  If login_name or password are empty or set to None then the connection is established using Integrated
            Security set to True
    """
    database = 'master' if database is None or database == '' else database
    connection_string = f'DRIVER={{ODBC Driver 17 for SQL Server}};' \
                        f'SERVER={server};' \
                        f'DATABASE={database};' \
                        f'APP={context};'

    connection_string += 'Trusted_Connection=yes;' \
        if login_name is None or password is None or login_name == '' or password == '' \
        else f'UID={login_name};PWD={password}'

    return pyodbc.connect(connection_string)


def find_write_references(
        db_schema: str,
        db_object: str,
        sql_server: SqlServer,
        ssis_collection: SSISCollection
):
    ssis_search_pattern = rf"\b(\[?{db_schema}\]?.)?\[?{db_object}\]?\b"
    tsql_search_pattern = rf"\b(INSERT INTO|UPDATE|MERGE INTO).*(\[?{db_schema}\]?.)?\[?{db_object}\]?\b"

    references = []
    for pkg in ssis_collection.ssis_packages:

        print(f"{dt.now()} | INFO | Searching for references in {pkg.package_name}", end='\r')
        if re.search(ssis_search_pattern, pkg.package_xml, flags=re.IGNORECASE | re.DOTALL | re.MULTILINE):
            references.append(pkg)

    if sql_server is not None:
        for db in sql_server.databases:

            print(f"{dt.now()} | INFO | Searching for references in {db.database} objects", end='\r')
            for obj in db.sql_objects:

                print(
                    f"{dt.now()} | INFO | Searching for references in {db.database} objects: "
                    f"{obj.object_schema}.{obj.object_name}", end='\r'
                )

                if re.search(
                        tsql_search_pattern,
                        obj.object_definition,
                        flags=re.IGNORECASE | re.DOTALL | re.MULTILINE
                ):
                    references.append(obj)

    return references


def do_the_thing(
    db_server: str = 'dendw02',
    databases: list[str] = ['EDW', 'EDW_Stage'],
    ssis_path: str = 'C:\\FileStore\\temp\\2024.09.05.EDW.SSIS.ISPAC.EXPORTS',

    xl_path: str = 'C:\\FileStore\\system\\edw\\dendw02-EDW_Stage-disk-usage-by-table-2024.08.09-11.50.xlsx',
    xl_sheet: str = 'all-tables',
    xl_range: tuple = ('B12', 'H771')
):

    wb = openpyxl.load_workbook(xl_path)
    ws = wb[xl_sheet]
    ws_range = ws[xl_range[0]: xl_range[1]]

    sql_server = SqlServer(db_server, databases) if db_server is not None else None
    ssis_collection = SSISCollection(ssis_path)

    results = []
    for row in ws_range:
        db_schema = row[0].value.split('.')[0]
        db_object = row[0].value.split('.')[1]

        if db_schema.lower() != 'stage_persistent':
            print(f"{dt.now()} | INFO | Searching for references to {row[0].value}", end='\r')
            refs = find_write_references(db_schema, db_object, sql_server, ssis_collection)

            results.append(refs)
            cell_value = '\n'.join([str(i) for i in refs])

            row[-1].value = cell_value

    wb.save(xl_path)
    return results


def find_obj_references(obj_db: str, obj_schema: str, obj_name: str, sql_server: SqlServer, recursive_search: bool = False):

    sp = fr'(\[?\b{obj_db}\b\]?\.)?(\[?\b{obj_schema}\b\]?\.)?\[?\b{obj_name}\b\]?'

    obj_matches = []
    for db in sql_server.databases:
        print(f'{datetime.datetime.now()} | INFO | Searching {db.database} for references to {obj_db}.{obj_schema}.{obj_name}')

        for o in db.sql_objects:
            print(f'Searching {o} for references', end='\r')

            if re.search(sp, o.sans_comments, flags=re.IGNORECASE | re.DOTALL | re.MULTILINE):
                if not (obj_db.lower() == db.database.lower() and obj_schema.lower() == o.object_schema.lower() and obj_name.lower() == o.object_name.lower()):
                    print(f'{datetime.datetime.now()} | INFO | One or more references found in {o}')
                    obj_matches.append((db.database, o))

                    if o.object_type == 'SQL_STORED_PROCEDURE':
                        sp = r""
                        objects_affected = []

                    if recursive_search:
                        addl_refs = find_obj_references(db.database, o.object_schema, o.object_name, sql_server)
                        obj_matches = obj_matches + addl_refs

    # TODO: Figure out how to handle the following cases: Below is the commented regex that is working for most scenarios right now
    #   db.schema.table
    #   server.db.schema.table
    #   db..table
    #   Instances where no schema (how to get decide the schema)

    # sp = (r'(?:INTO\s+(?:\[?(\w+)\]?\.)?)(?:\[?(\w+)\]?\s+FROM)|'
    #       r'(?:UPDATE\s+\[?(\w+)\]?\s+SET.*?FROM\s+(?:\[?(\w+)\]?\.)?\[?(\w+)\]?)|'
    #       r'(?:INSERT\s+INTO|UPDATE|MERGE\s+INTO)\s+(?:\[?(\w+)\]?\.)?(?:\[?(\w+)\]?)'
    # )

    # sp = (r'(?:INTO\s+(?:\[?(\w+)\]?\.)?)(?:\[?(\w+)\]?\s+FROM)|'
    #       r'(?:UPDATE\s+\[?(\w+)\]?\s+SET.*?FROM\s+(?:\[?(\w+)\]?\.)?\[?(\w+)\]?)|'
    #       r'(?:INSERT\s+INTO|UPDATE|MERGE\s+INTO)\s+(?:\[?(\w+)\]?\.)?(?:\[?(\w+)\]?)'
    #       )

    sp_obj = re.compile(r'(?:INSERT\s+INTO|UPDATE|MERGE\s+INTO)\s+(?:\[?(\w+)\]?\.\[?(\w+)\]?.\[?(\w+)\]?|()\[?(\w+)\]?.\[?(\w+)\]?|()()\[?(\w+)\]?))',flags=re.IGNORECASE | re.DOTALL | re.MULTILINE)
    print('', end='\r')
    return obj_matches
