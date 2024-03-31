#!/bin/bash

set -e

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
    libgl1-mesa-dev libglib2.0-0 libopencv-dev

useradd -m -s /bin/bash -u 1000 app

# nodejsインストール
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
apt-get update && apt-get install -y --no-install-recommends nodejs

# Cloud SDKインストール
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && \
    apt-get update -y && \
    apt-get install google-cloud-cli -y --no-install-recommends

apt-get clean
rm -rf /var/lib/apt/lists/*
