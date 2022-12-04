#!/bin/bash

DIR=$(pwd)
cd $(dirname $BASH_SOURCE)

echo "Copy package to /userdata/share..."
find ./megadrive_restyle/ -maxdepth 1 -mindepth 1 -type d ! -name .git | xargs -t -I {} cp -rf {} /
. /userdata/share/megadrive_restyle/install.sh

cd $DIR