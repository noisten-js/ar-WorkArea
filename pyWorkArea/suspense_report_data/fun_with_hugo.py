import datetime
from suspense_report_data.util import db_connect
from Enverus.jsutils import db_connect


def handle_nulls(v: str):
    return "None"


def handle_geometry():
    pass

dt_mapping = {
    str: str,
    int: str,
    None: handle_nulls,
    datetime.datetime: datetime.datetime.isoformat,
    bool: str,
    bin: handle_geometry

}


def do_the_thing():
    env_cn = db_connect(
        server="bi.drillinginfo.com",
        database="Drillinginfo_DIBI",
        login_name="env_2866",
        password="YRwmC1u5XSDa"
    )
    env_sql = "SELECT TOP 1000 convert(varbinary(max), GeomBHL_Point) GeomBHL_Point, WellID, CompletionID, WellName FROM env.Foundations_Wells"
    env_cr = env_cn.cursor()
    data = env_cr.execute(env_sql).fetchall()

    return data, env_cn


def do_the_other_thing():
    env_cn = db_connect(
        server="bi.drillinginfo.com",
        database="Drillinginfo_DIBI",
        login_name="env_2866",
        password="YRwmC1u5XSDa"
    )
    env_sql = "SELECT count(*) cnt FROM env.Foundations_Production"
    env_cr = env_cn.cursor()
    data = env_cr.execute(env_sql).fetchall()

    return data


def do_this(data):
    qstr = ",".join(["?" for _ in data[0]])
    cols = ",".join([c[0] for c in data[0].cursor_description])
    sql = f"INSERT INTO dbo.myTest ({cols}) VALUES ({qstr})"

    cn = db_connect("sqlodstest", "EnverusSync")
    cr = cn.cursor()
    cr.executemany(sql, data)
    cr.commit()


def and_this():
    cn = db_connect('sqleamtest', 'testeam12')
    dcn = db_connect('testdw01', 'EDW_Stage')

    sql = "SELECT * FROM sys.columns WHERE object_id = object_id('Stage.EAM_R5_TASKCHECKLISTS') or object_id = object_id('dbo.R5TASKCHECKLISTS')"

    cr = cn.cursor()
    dcr = dcn.cursor()

    eam_data = cr.execute(sql).fetchall()
    edw_data = dcr.execute(sql).fetchall()

    return eam_data, edw_data


