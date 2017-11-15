#!/bin/bash

hadoop fs -rm -r /output

ssh -t vm1 sh -c 'cat /proc/diskstats > /tmp/diskstats_pre'
ssh -t vm2 sh -c 'cat /proc/diskstats > /tmp/diskstats_pre'
ssh -t vm3 sh -c 'cat /proc/diskstats > /tmp/diskstats_pre'
ssh -t vm4 sh -c 'cat /proc/diskstats > /tmp/diskstats_pre'
ssh -t vm0 sh -c 'cat /proc/diskstats > /tmp/diskstats_pre'

time hadoop jar ac.jar MRApplication /input /output $1

ssh -t vm1 sh -c 'cat /proc/diskstats > /tmp/diskstats_post'
ssh -t vm2 sh -c 'cat /proc/diskstats > /tmp/diskstats_post'
ssh -t vm3 sh -c 'cat /proc/diskstats > /tmp/diskstats_post'
ssh -t vm4 sh -c 'cat /proc/diskstats > /tmp/diskstats_post'
ssh -t vm0 sh -c 'cat /proc/diskstats > /tmp/diskstats_post'

VMS='vm0 vm1 vm2 vm3 vm4'

for vm in $VMS ; do
    scp $vm:/tmp/diskstats_pre ./diskstats_pre_$vm
    scp $vm:/tmp/diskstats_post ./diskstats_post_$vm
