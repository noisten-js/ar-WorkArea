import datetime
import sys
import traceback
import time

import hashlib
import struct


def to_bytes(obj: object):
    if obj is None:
        return b'\0'
    elif isinstance(obj, int):
        return obj.to_bytes((obj.bit_length() + 7) // 8, byteorder='big', signed=True) or b'\0'

    elif isinstance(obj, float):
        return struct.pack('>d',obj)  # Convert float to 8-byte binary representation

    elif isinstance(obj, str):
        return obj.encode('utf-8')

    elif isinstance(obj, bool):
        return b'\1' if obj else b'\0'

    elif isinstance(obj, bytes):
        return obj

    elif isinstance(obj, datetime.datetime):
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


def main(cnt: int):
    print(f'I am trying it {cnt}')
    raise RuntimeError ("I didn't work")


if __name__ == '__main__':
    try_count = 1
    passed = False
    while try_count <= 5 and passed is False:
        try:
            main(try_count)
            passed = True
        except Exception:
            print('Failed waiting for 5 seconds')
            time.sleep(5)
            try_count += 1

    if passed is True:
        sys.exit(0)
    else:
        sys.exit(1)

