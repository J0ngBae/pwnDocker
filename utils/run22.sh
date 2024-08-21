#!/bin/bash

WORK=$1
docker run --rm --privileged --cap-add=SYS_PTRACE --security-opt seccomp:unconfined -it -v $WORK:/root/work --name pwn22 pwn22:latest /bin/zsh