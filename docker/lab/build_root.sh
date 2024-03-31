#!/bin/bash

apt-get update && \
    apt-get install -y --no-install-recommends curl \
    zip unzip \
    libffi-dev libssl-dev \
    python3-crcmod \
    apt-transport-https \
    lsb-release \
    openssh-client \
    gnupg \
    zlib1g-dev liblzma-dev libbz2-dev libreadline-dev \
    libicu-dev \
    libjpeg-dev libtiff-dev \
    nodejs npm libgl1-mesa-dev libglib2.0-0 libopencv-dev

useradd -m -s /bin/bash -u 1000 app

# Cloud SDKインストール
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && \
    apt-get update -y && \
    apt-get install google-cloud-cli -y --no-install-recommends


# install Nvidia driver

BASE_URL=https://us.download.nvidia.com/tesla
# 確認したバージョンを指定
DRIVER_VERSION=535.129.03
curl -fSsl -O ${BASE_URL}/${DRIVER_VERSION}/NVIDIA-Linux-x86_64-${DRIVER_VERSION}.run
bash NVIDIA-Linux-x86_64-${DRIVER_VERSION}.run

apt-get clean
rm -rf /var/lib/apt/lists/*
