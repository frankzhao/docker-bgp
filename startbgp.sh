#!/bin/sh
./bgp_simple.pl -myas 65000 -myip 172.17.0.11 -peerip 172.17.0.21 -peeras 65000 -p /root/routes -holdtime 6000 -m 2000 -n
