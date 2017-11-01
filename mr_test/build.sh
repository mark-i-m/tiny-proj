#!/bin/bash

export HADOOP_CP=/home/ubuntu/software/hadoop-2.6.0:/home/ubuntu/conf:/home/ubuntu/software/hive-1.2.1:/home/ubuntu/software/tez-0.7.1-SNAPSHOT-minimal/*:/home/ubuntu/software/tez-0.7.1-SNAPSHOT-minimal/lib/*::/home/ubuntu/conf:/home/ubuntu/software/hadoop-2.6.0/share/hadoop/common/lib/*:/home/ubuntu/software/hadoop-2.6.0/share/hadoop/common/*:/home/ubuntu/software/hadoop-2.6.0/share/hadoop/hdfs:/home/ubuntu/software/hadoop-2.6.0/share/hadoop/hdfs/lib/*:/home/ubuntu/software/hadoop-2.6.0/share/hadoop/hdfs/*:/home/ubuntu/software/hadoop-2.6.0/share/hadoop/yarn/lib/*:/home/ubuntu/software/hadoop-2.6.0/share/hadoop/yarn/*:/home/ubuntu/software/hadoop-2.6.0/share/hadoop/mapreduce/lib/*:/home/ubuntu/software/hadoop-2.6.0/share/hadoop/mapreduce/*

javac -cp ${HADOOP_CP} -d classes/ MRApplication.java
jar -cvf ac.jar -C classes/ .
