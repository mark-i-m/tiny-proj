
from cluster import master, slaves
import hadoop_testlib

jar = "hadoop/hadoop-mapreduce-project/hadoop-mapreduce-client/hadoop-mapreduce-client-shuffle/target/hadoop-mapreduce-client-shuffle-2.8.2.jar"

hadoop_testlib.deploy_new_shuffle(master, slaves, jar)
