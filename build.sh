#!/bin/sh

set -xe

# Build Raspberry Pi image
docker build -t mruettgers/rpi-prometheus -f targets/rpi/Dockerfile .

