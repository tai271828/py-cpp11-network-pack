#!/usr/bin/env python3
#
# pybind11 version of pack.py
# You may compare the result with ieee754 implementation with C and pack.py
#
import pack

def main():
    f = 3.1415926

    netf = pack.pack(f)
    f2 = pack.unpack(netf)

    print("Original: {}".format(f))
    print(" Network: {}".format(hex(netf)))
    print("Unpacked: {}".format(f2))

if __name__ == '__main__':
    main()
