#!/bin/bash

docker build . -t part5:1.0 -f ./Dockerfile; \
docker run -it -p 80:81 -v /users/ilnazkamalov/home/Develop/DO5_SimpleDocker-1/src/05/nginx.conf:/etc/nginx.conf -d part5:1.0 bash

sleep 2

dockle --ignore CIS-DI-0010 -ak NGINX_GPGKEY part5:1.0