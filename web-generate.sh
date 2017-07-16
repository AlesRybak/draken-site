#!/usr/bin/env bash

STATIC_DIR="static/photos"
DATA_DIR="data/photos"
WORK_DIR=$(pwd)

cd $STATIC_DIR
GAL_LIST=$(find . -type d -depth 1 | sort)
cd $WORK_DIR

for GAL in $GAL_LIST; do
    SOURCE_DIR="$STATIC_DIR/$GAL"
    TARGET_DIR="$DATA_DIR/$GAL"

    echo
    echo "--- Generate gallery metadata: $SOURCE_DIR"
    tools/extract-photos-info $SOURCE_DIR $TARGET_DIR
done

echo
echo "--- Generate thumbnails"
groovy tools/generate-thumbnails thumbnails.yml

echo
echo "--- Generate site"
hugo
