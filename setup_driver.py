
import hadoop_testlib



master = "c220g1-031117.wisc.cloudlab.us:22"
slaves = [
"c220g1-031124.wisc.cloudlab.us",
"c220g1-031111.wisc.cloudlab.us",
"c220g1-031107.wisc.cloudlab.us",
"c220g1-031109.wisc.cloudlab.us"]

device = "/dev/sdb"
hadoop_testlib.setup_hadoop_testbase(master, slaves, device)
