#!/bin/bash

DIR=$(pwd)
cd $(dirname $BASH_SOURCE)

echo "Patching default es-carbon theme..."
find ./patches -maxdepth 1 -iname '*.diff' | xargs -t -I {} patch -p 0 -N -i {}

echo "Copy resources..."
find ./ -maxdepth 1 -mindepth 1 -type d ! -name patches | xargs -t -I {} cp -rf {} /

cd $DIR