#!/bin/bash

# This script builds a Kali Linux ISO image using live-build.

cd kali-installer

./build.sh --variant default --distribution kali-dev --version 1.0 --verbose

