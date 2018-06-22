#!/bin/bash
#configuramos servidor DNS como BIND DNS unicamente!
docker exec -it host_h12 bash -c "echo nameserver 2001:bbbb:4444::20 > /etc/resolv.conf"
docker exec -it host_h14 bash -c "echo nameserver 2001:bbbb:4444::20 > /etc/resolv.conf"
