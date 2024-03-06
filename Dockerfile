FROM quay.io/jupyter/pytorch-notebook
WORKDIR /image-setup
COPY requirements.txt ./
RUN pip install torch==2.1.2 torchvision==0.16.2 torchaudio==2.1.2 --index-url https://download.pytorch.org/whl/cu121
RUN pip install -r requirements.txt
