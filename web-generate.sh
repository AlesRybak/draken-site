#!/usr/bin/env bash

STATIC_DIR="static/gallery"
DATA_DIR="data/gallery"
WORK_DIR=$(pwd)

cd $STATIC_DIR
GAL_LIST=$(find . -type d -depth 1 | sort)
cd $WORK_DIR

for GAL in $GAL_LIST; do
    SOURCE_DIR="$STATIC_DIR/$GAL"
    TARGET_DIR="$DATA_DIR/$GAL"

    echo "--- Generatingi gallery: $SOURCE_DIR"
    tools/extract-photos-info $SOURCE_DIR $TARGET_DIR
done
