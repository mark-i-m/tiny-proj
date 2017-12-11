
from cluster import master, slaves
import hadoop_testlib

tar = "hadoop/hadoop-dist/target/hadoop-2.8.2.tar.gz"
version = "2.8.2"

hadoop_testlib.deploy_new_hadoop(master, slaves, tar, version)
