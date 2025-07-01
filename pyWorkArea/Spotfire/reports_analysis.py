import csv
import os
import datetime
import sys


def load_action_logs(action_log_path: str, all_data: bool):
    data = []
    csv.field_size_limit(2147483647)

    for file in os.scandir(action_log_path):
        print(f'{datetime.datetime.now()} | INFO | Processing file: {file.path}', end='\r')

        if os.path.isfile(file.path) and file.name.split('.')[-1] == 'log':

            print(f'{datetime.datetime.now()} | INFO | Loading file: {file.path}', end='\r')

            with open(file.path, mode='r', newline='') as csv_file:
                csv_reader = csv.reader(csv_file, delimiter=';')

                for r in csv_reader:
                    if r[5] == 'library' and r[6] == 'load_content' and r[11] == 'dxp' or all_data:
                        too_long = False
                        x = ";".join(r[0:6])
                        for c in r:
                            if len(c) > 131072:
                                print(f'{x} is too long')
                                too_long = True

                        if not too_long:
                            data.append(r)
    return data


def generate_user_report_access(action_logs: list = None, action_log_path: str = None):
    if not action_logs and action_log_path:
        action_logs = load_action_logs(
            action_log_path=action_log_path,
            all_data=False
        )
    elif not action_log_path and not action_logs:
        raise KeyError("actions_logs or action_log_path must be specified!")

    report_logs = [
        ActionLogReportAccessEntry(
            log_date=datetime.datetime.fromisoformat(r[0]),
            log_user=r[2],
            report_id=r[9],
            report_path=r[10]
        ) for r in action_logs if r[5] == 'library' and r[6] == 'load_content' and r[11] == 'dxp'
    ]
    user_list = list(set([r.log_user for r in report_logs]))

    reports_by_user = {}
    for user in user_list:
        print(f'Getting reports access by {user}', end='\r')
        reports_by_user.update({user: {r.report_id: {'path': r.report_path, 'date': r.log_date} for r in report_logs if r.log_user == user}})

    return reports_by_user


class ActionLogReportAccessEntry:
    def __init__(
        self,
        log_date: datetime.datetime,
        log_user: str,
        report_id: str,
        report_path: str
    ):
        self.log_date = log_date
        self.log_user = log_user
        self.report_id = report_id
        self.report_path = report_path
        self.report_name = os.path.basename(report_path)

    def __str__(self):
        return self.report_name


"""
def combine_files(p: str = "C:\\FileStore\\Temp\\action_logs", combined_p: str = "C:\\FileStore\\Temp\\action_logs_combined.csv"):
    with open(combined_p, mode='a', newline='') as combined_csv_file:
        combined_csv_writer = csv.writer(combined_csv_file, delimiter=';', quoting=csv.QUOTE_MINIMAL, quotechar='"')
        for file in os.scandir(p):
            print(file.path, end='\r')

            with open(file.path, mode='r', newline='') as csv_file:
                data = [r for r in csv.reader(csv_file, delimiter=';', quoting=csv.QUOTE_MINIMAL, quotechar='"')]
                combined_csv_writer.writerows(data)


def load_active_reports(p: str = "C:\\FileStore\\temp\\antero.spotfire.activereports.asof.2025.01.17.csv"):
    # TODO: Modify to load active reports from database instead of file
    with open(p, mode='r', newline='') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=';', quotechar='"')
        cols = next(csv_reader)
        data = [r for r in csv_reader]

    return cols, data, {r[0]: r[1::] for r in data}


def get_active_report_logs(active_report_list: dict, p: str = "C:\\FileStore\\temp\\action_logs", ap: str = "C:\\FileStore\\temp\\active_report_logs"):
    file_list = [f for f in os.scandir(p)]

    for file in file_list:
        print(file.path, end='\r')
        with open(file.path, mode='r', newline='') as csv_file:
            csv_reader = csv.reader(csv_file, delimiter=';', quotechar='"')
            data = [r for r in csv_reader if r[5] == 'library' and active_report_list.get(r[9])]

        with open(ap, mode='a', newline='') as csv_file:
            csv_writer = csv.writer(csv_file, delimiter=";", quotechar='"', quoting=csv.QUOTE_MINIMAL)
            csv_writer.writerows(data)
"""