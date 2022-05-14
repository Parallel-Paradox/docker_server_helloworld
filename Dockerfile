# This docker file build a basic ubuntu server enviroment with
# Nginx, Gunicorn(eventlet), and Flask.
# A flask hello world application has been pre-placed in.
# 
# More information: https://github.com/Parallel-Paradox/docker_server_helloworld
# Author: ParallelParadox 2022/5/13 q1203981754@hotmail.com

FROM ubuntu
LABEL maintainer="ParallelParadox q1203981754@hotmail.com"

WORKDIR /home
EXPOSE 80

COPY . /home/docker_server_helloworld

RUN /bin/bash -c "./docker_server_helloworld/build/build.sh"
ENTRYPOINT /bin/bash -c "./docker_server_helloworld/build/net_init.sh"
