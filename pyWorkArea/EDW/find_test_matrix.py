import os
import re

ipath = "\\\\Antero\\shares"


def do_the_thing():
    sp = r'.*requirement.*matrix.*\.xlsx'
    matches = []

    for entry in os.walk(ipath):
        print(f'Searching: {entry[0]:100}', end='\r')

        for file in (entry[2]):
            if re.search(sp, file, flags=re.IGNORECASE | re.DOTALL):
                matches.append(os.path.join(entry[0], file))

    return matches


def do_the_thing_with_mike():
    print(f'this is right now and not here and never will be: {os.getcwd()}')