#!/bin/sh
./bgp_simple.pl -myas 65000 -myip `/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1 }'` -peerip 172.17.0.3 -peeras 65000 -p /root/routes -holdtime 6000 -m 2000 -n
