#!/bin/bash

source .env
ssh -t -L ${LocalPort}:127.0.0.1:${RemotePort} ${UserName}@${RemoteHost} \
    "[ -d \"${VolumeDir}\" ] && \
    [ -d \"${VolumeDir}/working\" ] && \
    [ -d \"${VolumeDir}/jupyter\" ] || \
    mkdir -p ${VolumeDir} ${VolumeDir}/working ${VolumeDir}/jupyter && \
    chmod 777 ${VolumeDir} ${VolumeDir}/working ${VolumeDir}/jupyter && \
    chown ${UserName}:${UserName} ${VolumeDir} ${VolumeDir}/working ${VolumeDir}/jupyter ; \
    docker run -p 127.0.0.1:${RemotePort}:${ContainerPort} -e GRANT_SUDO=yes --user root \
    -v /data:/data -v \"${VolumeDir}/working:/workspace\" -v \"${VolumeDir}/jupyter:/home/jovyan/.jupyter\" \
    -w /workspace --gpus all ${ImageName}"
