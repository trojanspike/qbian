DOCKER_IMAGE_VERSION=0.2.5
DOCKER_IMAGE_NAME=trojanspike/qbian
DOCKER_IMAGE_TAGNAME=$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)

default: build

build:
	docker build --rm -f Dockerfile -t $(DOCKER_IMAGE_TAGNAME) .
	docker tag $(DOCKER_IMAGE_TAGNAME) $(DOCKER_IMAGE_NAME):latest

push:
	docker push $(DOCKER_IMAGE_NAME)

run:
	docker run --rm -ti --privileged -P -v Workspace:/root/Workspace $(DOCKER_IMAGE_TAGNAME) /bin/bash

test:
	docker run --rm $(DOCKER_IMAGE_TAGNAME) /bin/bash -c "qbian --help"
