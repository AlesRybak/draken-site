#!/bin/bash

# regenerate the whole site just to be sure
./web_generate-metadata.sh
./web_generate-thumbs.sh

echo
echo "--- Generate production version"
hugo -b "http://new.draken.cz"

echo
echo "--- Send to production server"
rsync -az --delete --progress "public/" 'aldar@alry.cz:/var/www/cz_draken_new/'
