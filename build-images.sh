#!/bin/bash
#
# by lalves at lip.pt 2017
#
##

docker build -t cloudkeeper -f cloudkeeper/dockerfile ./cloudkeeper/
docker build -t cloudkeeper-os -f cloudkeeper-os/dockerfile ./cloudkeeper-os/
