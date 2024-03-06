#!/bin/bash

# Read variables from config.json
source config.json

# SCP Dockerfile to remote host
scp -r Dockerfile "${UserName}@${RemoteHost}:~/"

# SSH into remote host and build Docker image
ssh "${UserName}@${RemoteHost}" "docker build -t ${ImageName} ~/"