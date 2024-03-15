#!/bin/bash

# Read variables from config.json
source config.json

# SCP Dockerfile to remote host
scp -r Dockerfile requirements.txt "${UserName}@${RemoteHost}:~/"

# SSH into remote host and build Docker image
ssh "${UserName}@${RemoteHost}" "mkdir ~/tmp-build && cp Dockerfile requirements.txt ~/tmp && docker build -t ${ImageName} ~/tmp-build && rm -rf ~/tmp-build"