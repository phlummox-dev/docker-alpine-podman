
NAME=phlummox/alpine-podman
TAG=0.1

build:
	docker build  \
          --file Dockerfile \
          --build-arg USER_ID=$(shell id -u) \
          --build-arg USER_GID=$(shell id -g)\
          -t  $(NAME):$(TAG) .

run:
	docker -D run --rm -it --net=host \
			--privileged \
	    $(MOUNT) \
	    $(NAME):$(TAG)

