#!/bin/sh 
#Se eliminan los default gateways
ip -6 route del default
#Se agrea default gateway por eth0
ip -6 route add default dev eth0 via 2001:5555:cccc::50

