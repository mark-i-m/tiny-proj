#!/usr/bin/env python2

from sys import argv, exit

if len(argv) < 3:
    print("Usage: ./script outfile numlines_order\n(1 << numlines_order) lines will be output to outfile")
    exit(-1)

with open(argv[1], 'w') as f:
    for i in range(1 << int(argv[2])):
        f.write("0\n")
