MAINTAINER=labbsr0x
PROJECT=dns-bind9
VERSION=9.11.3


all: build

build:
	@docker build --tag=${MAINTAINER}/${PROJECT}:${VERSION} .
	@docker build --tag=${MAINTAINER}/${PROJECT}:latest .

push:
	@docker push ${MAINTAINER}/${PROJECT}:${VERSION}
	@docker push ${MAINTAINER}/${PROJECT}:latest 

docker-run:
	@docker run --rm --name bind -d --publish 53:53/tcp --publish 53:53/udp --volume ${PWD}/.bind9:/data ${MAINTAINER}/${PROJECT}

docker-stop:
	@docker stop bind