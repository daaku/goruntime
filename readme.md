goruntime
=========

Go applications are mostly statically compiled. They depend on libc & pthreads,
use the system certificate authority and the time zone database. This
`Dockerfile` builds a tiny base docker image that allows such applications to
run without having to pull a large image with an entire OS.

To build:

```
docker build -t daaku/make-goruntime . &&
docker run \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /usr/bin/docker:/usr/bin/docker \
  -t daaku/make-goruntime
```

This will result in a new image `daaku/goruntime` which can be used as the base
image for your go application.
