#!/usr/bin/env bash
set -xe

# Clean up temporary files
apt-get clean
apt-get autoclean
apt-get --purge -y autoremove

rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/*
