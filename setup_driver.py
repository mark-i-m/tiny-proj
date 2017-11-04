
import hadoop_testlib

master = "c220g1-030622.wisc.cloudlab.us:22"
slaves = ["c220g1-030624.wisc.cloudlab.us:22", "c220g1-030625.wisc.cloudlab.us:22", "c220g1-030626.wisc.cloudlab.us:22", "c220g1-030627.wisc.cloudlab.us:22"]
device = "/dev/sdb"
hadoop_testlib.setup_hadoop_testbase(master, slaves, device)
