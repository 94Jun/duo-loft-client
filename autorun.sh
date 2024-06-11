#!/bin/bash

name="duo_loft_"
host_port=80
docker_port=80

current_datetime=$(date +"%Y%m%d%H%M%S");

container_name="$name$current_datetime"

echo "$docker container created: ""$container_name"

############### 이미지 생성
docker build --progress=plain --no-cache -f Dockerfile -t "$container_name" .
docker images

echo "docker image($container_name) has been built."

############### 기존 컨테이너 stop
sh /home/ubuntu/shell_docker_stop "$name"

echo "The old container stopped."

############### 컨테이너 실행
docker run --name "$container_name" -d -e TZ=Asia/Seoul -p "$host_port":"$docker_port" "$container_name"

echo "docker container($container_name) starts."

docker ps -a