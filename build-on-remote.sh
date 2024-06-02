#!/bin/bash

source .env
scp -r Dockerfile requirements.txt "${UserName}@${RemoteHost}:~/"
ssh "${UserName}@${RemoteHost}" "mkdir ~/tmp-build && cp Dockerfile requirements.txt ~/tmp-build && docker build --build-arg BASE_IMAGE="${BaseImage}" -t ${ImageName} ~/tmp-build && rm -rf ~/tmp-build"
