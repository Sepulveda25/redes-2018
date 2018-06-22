#!/bin/bash

docker exec -it router_bgp1 ip -6 route del default
docker exec -it router_r3 ip -6 route del default
docker exec -it router_r5 ip -6 route del default
docker exec -it router_r7 ip -6 route del default

docker exec -it host_h11 ip -6 route del default
docker exec -it host_h13 ip -6 route del default

#docker exec -it DNS_service ip -6 route del default
#docker exec -it nginx ip -6 route del default
#docker exec -it strapi ip -6 route del default
#docker exec -it mongoDB ip -6 route del default

docker exec -it host_h11 ip -6 route add default via 2001:aaaa:5555::10
docker exec -it host_h13 ip -6 route add default via 2001:aaaa:7777::10
