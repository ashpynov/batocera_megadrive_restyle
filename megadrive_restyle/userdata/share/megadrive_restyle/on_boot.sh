#!/bin/bash

DIR=$(pwd)
cd $(dirname $BASH_SOURCE)

echo "Patching default es-carbon theme..."
find . -maxdepth 1 -iname '*.diff' | xargs -t -I {} patch -p 0 -N -i {}

cd $DIR