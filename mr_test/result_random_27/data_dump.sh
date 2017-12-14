#!/bin/bash

# deleting old files
rm -rf disk_read_data
rm -rf disk_read_time
rm -rf disk_write_data
rm -rf disk_write_time
rm -rf result_dump

# putting headers
echo "disk_read_data" > disk_read_data
echo "disk_read_time" > disk_read_time
echo "disk_write_data" > disk_write_data
echo "disk_write_time" > disk_write_time

# Read Data
expr `egrep sdb1 *post* | awk '{sum = sum + $7}END{bytes = sum}END{print bytes}'` - `egrep sdb1 *pre* | awk '{sum = sum + $7}END{bytes = sum}END{print bytes}'` >> disk_read_data
# Read Data Time Taken
expr `egrep sdb1 *post* | awk '{sum = sum + $10}END{print sum}'` - `egrep sdb1 *pre* | awk '{sum = sum + $10}END{print sum}'` >> disk_read_time
# Write Data
expr `egrep sdb1 *post* | awk '{sum = sum + $11}END{bytes = sum}END{print bytes}'` - `egrep sdb1 *pre* | awk '{sum = sum + $11}END{bytes = sum}END{print bytes}'` >> disk_write_data
# Write Data Time Taken
expr `egrep sdb1 *post* | awk '{sum = sum + $14}END{print sum}'` - `egrep sdb1 *pre* | awk '{sum = sum + $14}END{print sum}'` >> disk_write_time

paste disk_read_data disk_read_time disk_write_data disk_write_time > result_dump
