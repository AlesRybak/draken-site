#!/usr/bin/env bash

./web_generate-metadata.sh
./web_generate-thumbs.sh

echo
echo "--- Generate site"
hugo
