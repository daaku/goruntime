goruntime
=========

Go applications are *mostly* statically compiled. This `Dockerfile` builds a
tiny base docker image that allows such applications to run without having to
pull a large image with an entire OS.

Includes:

- libc
  - pthreads
  - resolv
- Ubuntu SSL Certificates
- Time Zone Database
- Protocols Names
- Service Names

To build:

```
docker build -t goruntime-builder . &&
docker run goruntime-builder | docker import - daaku/goruntime
```

This will result in a new image `daaku/goruntime` which can be used as the base
image for your go application.

Alternatively use this as a starting point to build your own tiny images.
