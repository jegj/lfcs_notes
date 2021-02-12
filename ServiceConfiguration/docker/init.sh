#!/bin/bash

sudo apt-get install docker

# Add user to docker group
usermod -aG docker vagrant

# 1) Search for images
docker search apache

# 2) Pull a image
docker pull httpd

# 3) List local images
docker images

# 4) Start a container
docker run httpd
docker run busybox ls
docker run busybox echo "hello"
docker run centos:7 ping 127.0.0.1

# 5) RUn container with temrinal
docker run -i -t centos:7 bash

# 6) Start container in detached mod
docker run -d httpd
docker run -d centos:7 ping 127.0.0.1

# 7) List All the containers
docker ps --all

# 8) Attach container
docker run --rm -dit centos:7 bash # delete if exists
docker attach <id>

# 9) Show container logs
docker logs <id/name>

# 10) Port fowarding
docker run -dit --name my-apache-app -p 8080:80 -v "$PWD":/usr/local/apache2/htdocs/ httpd
# Map container ports to host ports
docker run -d -P nginx
# This container will be restarted at bootstrap if the guest host will be restarted 
docker run -d -P --restart always nginx

# 11) Delete all the containers
docker rm $(docker ps -a -q)

# 12) Delete local image by id
docker rmi imageid

