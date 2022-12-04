#!/bin/bash

DIR=$(pwd)
cd $(dirname $BASH_SOURCE)

. ./megadrive_restyle/userdata/share/restyle/install.sh
batocera-save-overlay

cd $DIR