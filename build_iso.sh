#!/bin/bash

# This script builds a Kali Linux ISO image using live-build.

cd kali-installer

./build.sh --variant xfce --distribution kali-dev --version 1.0 --get-image-path --verbose