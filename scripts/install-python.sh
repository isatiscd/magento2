#!/usr/bin/env bash
set -xe

# Install essential tools
apt-get update -q
apt-get upgrade -y
apt-get install -y \
    apt-transport-https \
    apt-utils \
    curl \
    git \
    zip \
    python\
    unzip \
    libfontconfig

sh /scripts/cleanup.sh
