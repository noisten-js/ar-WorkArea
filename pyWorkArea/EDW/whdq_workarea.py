import csv


def do_the_thing():
    fp_oct = "C:\\FileStore\\temp\\well-creator-2024-10-30.csv"
    fp_nov = "C:\\FileStore\\temp\\well-creator-2024-11-22.csv"

    with open(fp_oct, newline='', mode='r') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter="\t", quotechar='"')
        cols_oct = next(csv_reader)
        data_oct = [r for r in csv_reader]

    with open(fp_nov, newline='', mode='r') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter="\t", quotechar='"')
        cols_nov = next(csv_reader)
        data_nov = [r for r in csv_reader]

    return {"oct": [cols_oct, data_oct], "nov": [cols_nov, data_nov]}

