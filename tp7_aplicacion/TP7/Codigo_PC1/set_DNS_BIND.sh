#!/bin/bash
#configuramos servidor DNS como BIND DNS unicamente!
docker exec -it host_h11 bash -c "echo nameserver 2001:aaaa:3333::20 > /etc/resolv.conf"
docker exec -it host_h13 bash -c "echo nameserver 2001:aaaa:3333::20 > /etc/resolv.conf"
