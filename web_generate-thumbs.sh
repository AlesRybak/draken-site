#!/usr/bin/env bash

STATIC_DIR="static"
PHOTOS_DIR="$STATIC_DIR/photos"
DATA_DIR="data/photos"
WORK_DIR=$(pwd)

echo
echo "--- Generate thumbnails"
groovy tools/generate-thumbnails thumbnails.yml
