FROM golang:1.8-jessie

RUN apt-get update
RUN apt-get install -qy --no-install-recommends supervisor quagga tcpdump
# Se instala la aplicacion traceroute
RUN apt-get install traceroute -y

# Se carga script para borrar el default gateway
RUN mkdir /script
COPY borrar_dgw.sh /script
RUN chmod +x /script/borrar_dgw.sh

ENTRYPOINT ["/usr/bin/supervisord"]
