FROM base/archlinux
MAINTAINER Naitik Shah "n@daaku.org"

RUN pacman --sync --refresh --sysupgrade --noconfirm
RUN pacman --sync --noconfirm ca-certificates docker

CMD tar \
    --create \
    --dereference \
    --directory=/ \
    --numeric-owner \
    --preserve-permissions \
    --add-file=etc/localtime \
    --add-file=etc/protocols \
    --add-file=etc/services \
    --add-file=etc/ssl/certs/ca-certificates.crt \
    --add-file=lib64/ld-linux-x86-64.so.2 \
    --add-file=usr/lib/libc.so.6 \
    --add-file=usr/lib/libpthread.so.0 \
    --add-file=usr/share/zoneinfo | docker import - daaku/goruntime
