#!/bin/bash

NET_NAME=`ifconfig |grep -v "^ "|grep " "|awk -F " " '{print $1}'`
NET_IP=`ifconfig |grep "inet addr"|awk -F: '{print $2}'|awk -F " " '{print $1}'`
ifconfig |grep -v "^ "|grep " "|awk -F: '{print $1}' >/tmp/ifconfig_bk
NUMBER=`wc -l /tmp/ifconfig_bk |awk -F " " '{print $1}'`
number=`echo "$NUMBER-1"|bc`
net_name=($NET_NAME)
net_ip=($NET_IP)
echo $net
for i in $(seq 0 $number);do
echo "${net_name[i]}:${net_ip[i]}"
done
~    
