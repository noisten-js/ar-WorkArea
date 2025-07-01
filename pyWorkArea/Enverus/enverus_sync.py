from Enverus.jsutils import db_connect
import json
import datetime


def do_the_thing(i=100000):
    srcSvr = 'biconnect.enverus.com'
    srcDb = 'DrillingInfo_DIBI'
    srcUsr = 'env_2866'
    srcPw = 'YRwmC1u5XSDa'

    srcCn = db_connect(srcSvr, srcDb, srcUsr, srcPw)
    srcCr = srcCn.cursor()

    sql = f"SELECT TOP {i} * FROM env.Foundations_Wells"

    data = srcCr.execute(sql).fetchall()

    return data


def sql_rows_to_json(data):
    def quoteString(s: str):
        return s.replace("'", "''")

    dt_mapping = {
        datetime.datetime: datetime.datetime.isoformat,
        str: quoteString,
    }

    cols = [c for c in data[0].cursor_description]
    dData = []

    for row in data:
        dRow = {}
        for col in cols:
            v = row.__getattribute__(col[0])
            if v:
                converter = dt_mapping.get(col[1])
                v = v if converter is None else converter(v)
                dRow.update({col[0]: v})

        dData.append(dRow)

    return dData


if __name__ == '__main__':
    x = do_the_thing()
    dData = sql_rows_to_json(x)
    cn = db_connect('(local)', 'WorkArea')
    cr = cn.cursor()
    cr.execute("EXEC dbo.spTestJson @Param1=?", json.dumps(dData))
    cr.commit()
