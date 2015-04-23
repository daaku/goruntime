goruntime-example
=================

Included is a go example along with a pre-compiled binary which triggers use of:

- DNS
- TLS certificate validation

To run it:

```sh
docker build -t daaku/goruntime-example . &&
docker run -ti daaku/goruntime-example
```
