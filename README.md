# docker-alpine-podman

[![Docker hub version](https://img.shields.io/docker/v/phlummox/alpine-podman?label=Docker%20Hub)](https://hub.docker.com/r/phlummox/alpine-podman)
[![build](https://github.com/phlummox-dev/docker-alpine-podman/actions/workflows/docker-image.yml/badge.svg)](https://github.com/phlummox-dev/docker-alpine-podman/actions/workflows/docker-image.yml)

Podman 3.2.3 running on Alpine 3.14.

Sample use:

```
$ docker run --rm -it --privileged --net=host phlummox/alpine-podman \
      podman --log-level=debug system service --time=0 tcp:0.0.0.0:3000
```

