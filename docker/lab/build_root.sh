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
    software-properties-common \
    nodejs npm libgl1-mesa-dev libglib2.0-0 libopencv-dev

useradd -m -s /bin/bash -u 1000 app

# Cloud SDKインストール
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && \
    apt-get update -y && \
    apt-get install google-cloud-cli -y --no-install-recommends

# install Nvidia driver
curl -fSsl -O https://developer.download.nvidia.com/compute/cuda/repos/debian11/x86_64/cuda-keyring_1.1-1_all.deb
dpkg -i cuda-keyring_1.1-1_all.deb
rm cuda-keyring_1.1-1_all.deb
add-apt-repository contrib
apt-get update
apt-get install -y --no-install-recommends cuda-toolkit-12-4
apt-get install -y --no-install-recommends nvidia-kernel-open-dkms
apt-get install -y --no-install-recommends nvidia-driver

apt-get clean
rm -rf /var/lib/apt/lists/*
