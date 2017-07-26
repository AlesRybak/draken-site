#!/usr/bin/env bash

STATIC_DIR="static"
PHOTOS_DIR="$STATIC_DIR/photos"
DATA_DIR="data/photos"
WORK_DIR=$(pwd)

echo
echo "--- Normalize filenames"
tools/normalize-filenames "$STATIC_DIR"
tools/normalize-filenames "content"

cd "$PHOTOS_DIR"
GAL_LIST=$(find . -type d -depth 1 | sort)
cd $WORK_DIR

IFS=$'\n'
for GAL in $GAL_LIST; do
    SOURCE_DIR="$PHOTOS_DIR/$GAL"
    TARGET_DIR="$DATA_DIR/$GAL"

    echo
    echo "--- Generate gallery metadata: $SOURCE_DIR"
    tools/extract-photos-info "$SOURCE_DIR" "$TARGET_DIR"
done

echo
echo "--- Generate thumbnails"
groovy tools/generate-thumbnails thumbnails.yml

echo
echo "--- Generate site"
hugo
