#
# Program: Dockerfile for MongoDB ReplicaSet
# Authors: zhezhang
# History:
#	2017/06/21: build mgo image with centos
# 	2017/07/19: update: build mgo image with alpine
#
# Build Images:
# 	docker build -t <image_name> .
#	docker build --no-cache -t mgors:base
#
# Run Container:
# 	docker run --name <container_name> --net docker1 --ip 172.18.0.167 --restart always -v <host_dir>:<container_dir> -d mgors:base
#	eg: docker run --name rs1 --net docker1 --ip 172.18.0.167 --restart always -v /home/mgors/rs1:/home/mgo -d mgors:base
#
# StartÂ·Stop:
# 	docker start|stop container_name
#
# Delete:
# 	docker rm -v container_name
#
# Get Container Ip:
# 	docker-ip container_name ...
#
# Entry Container
# 	docker exec -it container_name /bin/bash
#

FROM alpine:latest

ENV MgoHome=/home/mgo

MAINTAINER <xxx@163.com>

WORKDIR ${MgoHome}

RUN apk update \
	&& apk add mongodb --no-cache --repository http://dl-4.alpinelinux.org/alpine/edge/testing --allow-untrusted \
	&& rm -rf /var/cache/apk/*

RUN	echo 'http://mirrors.ustc.edu.cn/alpine/v3.5/main' > /etc/apk/repositories \
	&& echo 'http://mirrors.ustc.edu.cn/alpine/v3.5/community' >> /etc/apk/repositories \
	&& apk update && apk add tzdata \
	&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo "Asia/Shanghai" > /etc/timezone \
	&& mkdir -p ${MgoHome}/data/db \
	&& touch ${MgoHome}/mongod.log

EXPOSE 27017

COPY mongod.conf mongodkey run.sh ${MgoHome}/

CMD ["./run.sh"]