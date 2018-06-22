#!/bin/bash

docker exec -it host_h12 bash -c "echo "nginx_as101.crt" >> /etc/ca-certificates.conf"
docker exec -it host_h12 bash -c "echo "nginx_as202.crt" >> /etc/ca-certificates.conf"
docker exec -it host_h12 update-ca-certificates --fresh

docker exec -it host_h14 bash -c "echo "nginx_as101.crt" >> /etc/ca-certificates.conf"
docker exec -it host_h14 bash -c "echo "nginx_as202.crt" >> /etc/ca-certificates.conf"
docker exec -it host_h14 update-ca-certificates --fresh
