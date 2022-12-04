#!/bin/bash

DIR=$(pwd)
WD=$(dirname $(realpath $BASH_SOURCE))

case "$1" in

  package)
    cd $WD
    cd megadrive_restyle && batocera-makepkg -f
    cd $DIR
    ;;

  install)
    cd $WD
    rm -rf /userdata/share/megadrive_restyle
    echo "Copy package to /userdata/share..."
    find ./megadrive_restyle/ -maxdepth 1 -mindepth 1 -type d ! -name .git | xargs -t -I {} cp -rf {} /
    . /userdata/share/megadrive_restyle/install.sh
    cd $DIR
    ;;

  install-package)
    cd $WD/megadrive_restyle && batocera-makepkg -f 
    cd $WD
    rm -rf /userdata/share/megadrive_restyle
    pacman -U megadrive_restyle-*.pkg.tar.zst
    cd $DIR
    ;;

  *)
    echo "Usage: bash make <target>"
    echo "Where target are:"
    echo "   package - build pacman package"
    echo "   install - install files as Copy"
    echo "   install-package - install as pacman package"
    ;;
esac