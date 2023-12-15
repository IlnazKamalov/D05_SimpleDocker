#!/bin/bash

docker build -t part4:1.0 .
#. build.sh
docker run -it -p 80:81 -v /users/ilnazkamalov/home/Develop/DO5_SimpleDocker-1/src/04/nginx.conf:/etc/nginx.conf -d part4:1.0 bash