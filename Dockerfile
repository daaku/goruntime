FROM daaku/arch
MAINTAINER Naitik Shah "n@daaku.org"

RUN pacman --sync --noconfirm \
  busybox \
  ca-certificates \
  docker \
  rsync \
  tar

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
    /usr/lib/libc.so.6 \
    /usr/lib/libpthread.so.0 \
    /usr/lib/libnss_dns.so.2 \
    /usr/lib/libresolv.so.2 \
    /usr/bin/busybox \
    /usr/share/zoneinfo \
    /goruntime

CMD tar \
    --create \
    --dereference \
    --directory=/goruntime \
    --numeric-owner . | docker import - daaku/goruntime
