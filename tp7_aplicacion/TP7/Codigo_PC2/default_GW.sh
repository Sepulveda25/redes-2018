#!/bin/bash

docker exec -it router_bgp2 ip -6 route del default
docker exec -it router_r4 ip -6 route del default
docker exec -it router_r6 ip -6 route del default
docker exec -it router_r8 ip -6 route del default

docker exec -it host_h12 ip -6 route del default
docker exec -it host_h14 ip -6 route del default

#docker exec -it DNS_service ip -6 route del default
#docker exec -it nginx ip -6 route del default
#docker exec -it strapi ip -6 route del default
#docker exec -it mongoDB ip -6 route del default

docker exec -it host_h12 ip -6 route add default via 2001:bbbb:6666::10
docker exec -it host_h14 ip -6 route add default via 2001:bbbb:8888::10


