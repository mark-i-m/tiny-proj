#!/bin/bash

export HADOOP_CP=/users/markm/software/hadoop-2.6.0:/users/markm/conf:/users/markm/software/hive-1.2.1:/users/markm/software/tez-0.7.1-SNAPSHOT-minimal/*:/users/markm/software/tez-0.7.1-SNAPSHOT-minimal/lib/*::/users/markm/conf:/users/markm/software/hadoop-2.6.0/share/hadoop/common/lib/*:/users/markm/software/hadoop-2.6.0/share/hadoop/common/*:/users/markm/software/hadoop-2.6.0/share/hadoop/hdfs:/users/markm/software/hadoop-2.6.0/share/hadoop/hdfs/lib/*:/users/markm/software/hadoop-2.6.0/share/hadoop/hdfs/*:/users/markm/software/hadoop-2.6.0/share/hadoop/yarn/lib/*:/users/markm/software/hadoop-2.6.0/share/hadoop/yarn/*:/users/markm/software/hadoop-2.6.0/share/hadoop/mapreduce/lib/*:/users/markm/software/hadoop-2.6.0/share/hadoop/mapreduce/*

javac -cp ${HADOOP_CP} -d classes/ MRApplication.java && jar -cvf ac.jar -C classes/ .
