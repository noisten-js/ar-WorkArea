from Enverus.jsutils import db_connect
import traceback
import datetime
import os
import re
import base64
from Enverus.enverus_sync import sql_rows_to_json


def get_the_data():
    cn = db_connect('dendw02', 'EDW_Stage')
    cr = cn.cursor()
    with open("sql.sql", mode='r') as f:
        sql = f.read()

    data = cr.execute(sql).fetchall()
    jdata = sql_rows_to_json(data)

    return jdata


# def dv_test():
#     src_cn = db_connect('testods01', 'EnertiaLive')
#     src_cr = src_cn.cursor()
#
#     dst_cn = db_connect('devdw01', 'EDW_Stage')
#     dst_cr = dst_cn.cursor()
#
#     src_sql = "SELECT * FROM dbo.glMasDtlPostTxn"
#     data = src_cn.execute(src_sql).fetchall()
#     col_str = ','.join([c[0] for c in data[0].cursor_description])
#     q_str = ','.join(['?' for _ in data[0].cursor_description])
#     dst_sql = f"INSERT INTO Stage.Enertia_glMasDtlPostTxn ({col_str}, RowHash, ETL_Load_Date) VALUES ({q_str}, hashbytes('SHA2_256', 'JASON'), sysdatetime())"
#
#     dst_cn.execute(dst_sql, data)
#     dst_cn.commit()
#
#
# def reorder_jobsetps():
#     cn = db_connect('densql07', 'msdb')
#     cr = cn.cursor()
#
#     job_sql = "SELECT job_id, job_name=name FROM dbo.sysjobs"
#     step_sql = "SELECT step_name, step_id, subsystem, command, on_success_step_id FROM dbo.sysjobsteps WHERE job_id = ?"
#
#     job_data = [{"job_id": r.job_id, "job_name": r.job_name} for r in cr.execute(job_sql).fetchall()]
#
#     for job in job_data:
#         step_data = [
#             {
#                 "step_id": r.step_id,
#                 "step_name": r.step_name,
#                 "subsystem": r.subsystem,
#                 "command": r.command,
#                 "on_success_step_id": r.on_success_step_id
#             }
#             for r in cn.execute(step_sql, job['job_id']).fetchall()
#         ]
#
#         job.update({"job_steps": step_data})
#
#     return job_data
#
#     # sql = (
#     #     "SELECT\n"
#     #     "\t t0.job_id\n"
#     #     "\t,t0.name\n"
#     #     "\t,t1.step_name\n"
#     #     "\t,t1.step_id\n"
#     #     "\t,t1.subsystem\n"
#     #     "\t,t1.command\n"
#     #     "\t,t1.on_success_step_id\n"
#     #     "FROM\n"
#     #     "\tdbo.sysjobs t0\n"
#     #
#     #     "\tINNER JOIN dbo.sysjobsteps t1\n"
#     #     "\t\tON t0.job_id = t1.job_id\n"
#     #
#     #     "WHERE 1=1\n"
#     #     "\tAND t0.name IN (\n"
#     #     "\t\t'DENSQL07 - Refresh Pay Per Lease'\n"
#     #     "\t\t,'SSIS - Database - Restore - EnertiaLive'\n"
#     #     "\t\t,'DENSQL07 - Refresh Legal'\n"
#     #     "\t\t,'DENSQL07 - Refresh Suspense'\n"
#     #     "\t)\n"
#     #     "ORDER BY\n"
#     #     "\t t0.name\n"
#     #     "\t,t1.step_id\n"
#     # )
#     #
#     # data = cr.execute(sql).fetchall()
#     # return data
#
#
# # def do_the_thing():
# #     folders = []
# #
# #     try:
# #         for entry in os.walk("C:\\"):
# #             folder = {"path": entry[0], "files": []}
# #
# #             folder_size = 0
# #             for file in entry[2]:
# #                 try:
# #                     stats = os.stat(os.path.join(entry[0], file))
# #                     folder_size += stats.st_size
# #                     folder['files'].append({
# #                         "path": entry[0],
# #                         "name": file,
# #                         "size": stats.st_size,
# #                         "modified_date": stats.st_mtime
# #                     })
# #                 except WindowsError:
# #                     tb = traceback.format_exc()
# #                     print('inner: {0}'.format(tb))
# #
# #             folder.update({"folder_size": folder_size})
# #             folders.append(folder)
# #
# #     except WindowsError:
# #         tb = traceback.format_exc()
# #         print(tb)
# #
# #     return folders
# #
# #
# # # files = sorted([f for e in x for f in e['files']], key=lambda x: x['modified_date'], reverse=True)
# # files = sorted(
# #     [
# #         f for e in x for f in e['files']
# #         if re.search(r"(c:\\users|c:\\\$recycle\.bin)", f["path"], flags=re.IGNORECASE) is None
# #     ], key=lambda x: x['modified_date'], reverse=True
# # )
# #
# # with open("M:\\EDWFileShare\\temp\\full_file_list.2024.09.13.csv", mode='w') as fo:
# #     fo.write('mod_date,size (MB),file\n')
# #     for i in files:
# #         ln = '{},{},{}\n'.format(
# #             datetime.datetime.fromtimestamp(i['modified_date']),
# #             i['size'] / 1024.0 / 1024.0,
# #             os.path.join(i['path'], i['name'])
# #         )
# #         fo.write(ln)
# """