
import hadoop_testlib

master = "c220g1-031117.wisc.cloudlab.us:22"
slaves = [
"c220g1-031124.wisc.cloudlab.us",
"c220g1-031111.wisc.cloudlab.us",
"c220g1-031107.wisc.cloudlab.us",
"c220g1-031109.wisc.cloudlab.us"]

tar = "hadoop/hadoop-dist/target/hadoop-2.8.2.tar.gz"

version = "2.8.2"

hadoop_testlib.deploy_new_hadoop(master, slaves, tar, version)
