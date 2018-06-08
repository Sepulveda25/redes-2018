#!/bin/sh 
#Se elimina el default gateway
ip -6 route del default
#Se agrea default gateway por eth0
ip -6 route add default dev eth0 via 2001:7c::70

