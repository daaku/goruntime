FROM ubuntu
MAINTAINER Naitik Shah "n@daaku.org"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y --no-install-recommends install \
      ca-certificates \
      rsync

RUN mkdir /goruntime
RUN rsync \
    --copy-links \
    --group \
    --owner \
    --perms \
    --recursive \
    --relative \
    /etc/protocols \
    /etc/services \
    /etc/ssl/certs/ca-certificates.crt \
    /lib64/ld-linux-x86-64.so.2 \
    /lib/x86_64-linux-gnu/libc.so.6 \
    /lib/x86_64-linux-gnu/libpthread.so.0 \
    /lib/x86_64-linux-gnu/libnss_dns.so.2 \
    /lib/x86_64-linux-gnu/libresolv.so.2 \
    /usr/share/zoneinfo \
    /goruntime

CMD tar \
    --create \
    --dereference \
    --directory=/goruntime \
    --numeric-owner \
    -f - \
    .
