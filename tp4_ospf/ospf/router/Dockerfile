# Quagga OSPF
#
# VERSION 0.0.1

FROM golang:1.8-jessie

MAINTAINER Cuenca del Rey, Matias <matias.cuenca@unc.edu.ar>

RUN apt-get update
RUN apt-get install -qy --no-install-recommends supervisor quagga telnet tcpdump

RUN sed -i 's/ospfd=no/ospfd=yes/g' /etc/quagga/daemons
RUN sed -i 's/ospfd6=no/ospfd6=yes/g' /etc/quagga/daemons
RUN sed -i 's/zebra=no/zebra=yes/g' /etc/quagga/daemons

# Se carga script para borrar el default gateway
RUN mkdir /script
COPY borrar_dgw.sh /script
RUN chmod +x /script/borrar_dgw.sh

RUN apt-get install traceroute -y

ENTRYPOINT ["/usr/bin/supervisord"]
