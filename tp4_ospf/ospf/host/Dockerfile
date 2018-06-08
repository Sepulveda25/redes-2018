
FROM golang:1.8-jessie

RUN apt-get update
RUN apt-get install -qy --no-install-recommends supervisor quagga telnet tcpdump

# Se carga script para borrar el default gateway
RUN mkdir /script
COPY borrar_dgw.sh /script
RUN chmod +x /script/borrar_dgw.sh

RUN apt-get install traceroute -y

ENTRYPOINT ["/usr/bin/supervisord"]
