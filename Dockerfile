
FROM alpine:3.14@sha256:eb3e4e175ba6d212ba1d6e04fc0782916c08e1c9d7b45892e9796141b1d379ae

RUN \
  apk add \
    bridge-utils  \
    docker        \
    podman        \
    podman-remote \
    procps        \
    shadow        \
    sudo

ARG USER_NAME=user
ARG USER_ID=1001
ARG USER_GID=1001

ENV user_uid=$USER_ID
ENV user_gid=$USER_GID

RUN : "adding user" && \
  addgroup -g $user_gid user && \
  adduser  -D -G user -u $user_uid -g '' user && \
  echo '%user ALL=(ALL) NOPASSWD:ALL' | tee -a /etc/sudoers

USER user
ENV HOME=/home/user
ENV PATH="$HOME/.local/bin:${PATH}"

RUN \
  mkdir -p ~/.local/bin && \
  sudo usermod --add-subuids 100000-165535 $USER_NAME && \
  sudo usermod --add-subgids 100000-165535 $USER_NAME


