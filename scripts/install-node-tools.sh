#!/usr/bin/env bash
set -xe

# Install Node tools
npm install -g node-gyp
npm install -g parcel-bundler

npm cache clean --force
