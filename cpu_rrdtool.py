#!/usr/bin/python

import psutil
import rrdtool

cpu_us=psutil.cpu_times().user
cpu_sys=psutil.cpu_times().system
cpu_io=psutil.cpu_times().iowait
starttime=int(time.time())
update=rrdtool.update('/home/test/rrdtool/Flow.rrd','%s:%s:%s:%s'%(str(starttime),str(cpu_us),str(cpu_sys),str(cpu_io)))
print update
