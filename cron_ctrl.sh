#!/bin/bash

USAGE="Usage: $(basename $0) < jobname >  --start | --stop  | --list | --help | --version"
SERVICEDIR="/etc/init.d"
VERSION="cron_ctrl v1.1"

if [ $# -eq 0 ]; then
   	echo "${USAGE}" >&2
   	exit 1
fi

cd /
while [ $# -gt 0 ]; do
  	case "${2}" in
    --help | -h | --h* )
    	echo "${USAGE}" >&2
       	exit 0
       	;;
    --version | -V )
       	echo "${VERSION}" >&2
       	exit 0
       	;;
    --stop)
	   	grep $1 /etc/crontab 2&>/dev/null
	   	if [ $? -eq 0 ];then
	   		JOB=`grep $1 /etc/crontab | sed "s/^/#/g"`
			sed -i "/$1/d" /etc/crontab && echo $JOB >> /etc/crontab
			/etc/init.d/crond restart > /dev/null && echo "$1 already stop..." && exit 0 || echo "$1 stop faild && exit 1"
		else
			echo "Don't find the $1" && exit 1
		fi
	   	;;
    --start)
	   	grep $1 /etc/crontab 2&>/dev/null
	   	if [ $? -eq 0 ];then
	   		JOB=`grep $1 /etc/crontab | sed "s/^#//g"`
			sed -i "/$1/d" /etc/crontab && echo $JOB >> /etc/crontab
			/etc/init.d/crond restart > /dev/null && echo "$1 already start..." && exit 0 || echo "$1 start faild && exit 1"
		else
			echo "Don't find the $1" && exit 1
		fi
	   	;;
    --list)
	   	grep $1 /etc/crontab
	   	if [ $? -ne 0 ];then
			echo "Don't find the $1" && exit 1
		fi
	   	;;
	esac
done
