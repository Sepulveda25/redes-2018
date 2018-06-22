#!/bin/bash

docker exec -it host_h11 bash -c "echo "nginx_as101.crt" >> /etc/ca-certificates.conf"
docker exec -it host_h11 bash -c "echo "nginx_as202.crt" >> /etc/ca-certificates.conf"
docker exec -it host_h11 update-ca-certificates --fresh

docker exec -it host_h13 bash -c "echo "nginx_as101.crt" >> /etc/ca-certificates.conf"
docker exec -it host_h13 bash -c "echo "nginx_as202.crt" >> /etc/ca-certificates.conf"
docker exec -it host_h13 update-ca-certificates --fresh
