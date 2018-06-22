#!/bin/sh -e
#Se eliminan los default gateways
ip -6 route del default
#Se agrea default gateway por eth0
ip -6 route add default dev eth0 via 2001:bbbb:8888::10

