#!/bin/bash

WORK=$1
docker run --rm --privileged --cap-add=SYS_PTRACE --security-opt seccomp:unconfined -it -v $WORK:/root/work --name pwn20 pwn20:latest /bin/zsh