#!/bin/bash

NET_NAME=`ifconfig |grep -v "^ "|grep "Link"|awk -F" " '{print $1}'`
NET_IP=`ifconfig |grep "inet addr"|awk -F " " '{print $2}'|cut -d: -f2`
for NAME in $NET_NAME;do
	echo $NAME >> name
done
for IP in $NET_IP;do
	echo $IP >> ip
done
awk 'NR==FNR{a[NR]=$0}NR>FNR{print a[FNR]":"$0""}' name ip
rm -f name ip
