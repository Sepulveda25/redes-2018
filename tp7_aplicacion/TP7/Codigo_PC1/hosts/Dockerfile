FROM golang:1.8-jessie

RUN apt-get update
RUN apt-get install traceroute
RUN apt-get install -qy --no-install-recommends supervisor traceroute dnsutils host

# ENTRYPOINT ["/bin/bash"]
