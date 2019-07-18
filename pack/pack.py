#!/usr/bin/env python3
#
# You may compare the result with ieee754 implementation with C
#
import struct

def main():
    f = 3.1415926

    netf = struct.pack('!f', f)
    f2, = struct.unpack('!f', netf)

    print("Original: {}".format(f))
    print(" Network: 0x{}".format(netf.hex()))
    print("Unpacked: {}".format(f2))

if __name__ == '__main__':
    main()
