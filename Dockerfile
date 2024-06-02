ARG BASE_IMAGE=quay.io/jupyter/pytorch-notebook:cuda12-latest
FROM ${BASE_IMAGE}
WORKDIR /image-setup
COPY requirements.txt ./
RUN pip install -r requirements.txt
