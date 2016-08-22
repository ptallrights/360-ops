#!/bin/sh
. /root/.bash_profile

body() {
    IFS= read -r header
    printf '%s\n' "$header"
    "$@"
}

top10() {
	echo "CPU占用Top 10"
	echo "----------------------------------"
	ps -eo rss,pmem,pcpu,vsize,args |body sort -k 3 -r -n | head -n 10
}

cpu_stat() {
	echo "最近1小时cpu使用统计"
	echo "----------------------------------"
	sar -u -s `date -d "1 hour ago" +%H:%M:%S`
}

top10 >> /var/log/cpu_top.log
cpu_stat >> /var/log/cpu_stat.log