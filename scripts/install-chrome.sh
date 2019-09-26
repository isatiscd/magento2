#!/usr/bin/env bash
set -xe

# Install essential tools
apt-get update -q
apt-get upgrade -y
apt-get install -y \
    libappindicator3 \
    fonts-liberation \
    libasound2 \
    libgconf-2-4 \
    libnspr4 \
    libxss1 \
    libnss3 \
    xdg-utils

export CHROME_BIN=/usr/bin/google-chrome
export DISPLAY=:99.0

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome*.deb

sh /scripts/cleanup.sh
