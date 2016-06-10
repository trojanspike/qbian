FROM ubuntu:14.04

MAINTAINER Lee Mc Kay <v3047-githib@yahoo.co.uk>

ENV DEBIAN_FRONTEND noninteractive
ENV DOCKER_ENV true

RUN apt-get update

RUN apt-get install -y \
	qemu-system-arm \
	kpartx \
	rsync \
	curl \
	git-core \
	vim \
	openssh-server && \
	apt-get clean

ADD . /qbian-cli/

RUN ln -s /qbian-cli/bin/qbian /usr/bin/

RUN mkdir /root/Workspace

WORKDIR /root/Workspace

EXPOSE 80 443 8080 1374

VOLUME /root/Workspace

CMD ["qbian", "--version"]
