#!/bin/bash
docker build -t cloudkeeper -f dockerfiles/Dockerfile.cloudkeeper ./dockerfiles/
docker build -t cloudkeeper-os -f dockerfiles/Dockerfile.cloudkeeper-os ./dockerfiles/
