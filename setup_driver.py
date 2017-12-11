
from cluster import master, slaves
import hadoop_testlib

device = "/dev/sdb"

hadoop_testlib.setup_hadoop_testbase(master, slaves, device)
