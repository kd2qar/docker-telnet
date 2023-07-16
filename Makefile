NAME = telnet
TAG = kd2qar/telnet

LOG=--log-driver json-file --log-opt max-size=10m --log-opt max-file=3

MOUNTS= -v /etc/localtime:/etc/localtime:ro

all:: build

run: build 
	docker run -it --rm ${TAG}

shell:
	docker run --name ${NAME}docker-shell -it --rm --entrypoint /bin/bash  ${TAG} 

test:
	docker run --rm --name ${NAME} ${MOUNTS} -it ${PUBLISH}  ${TAG}	

build:
	docker build --pull  --force-rm --tag=$(TAG) . 

remove:
	docker stop ${NAME} 2>/dev/null;true;
	docker rm ${NAME} 2>/dev/null;true;
	docker stop ${NAME}docker-shell 2>/dev/null;true;
	docker rm ${NAME}docker-shell 2>/dev/null;true;

