#!/bin/bash

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# pull mitamae
arch=$(uname -m)

sudo mkdir /usr/local/bin

if [ arch = "arm64" ] ; then
    sudo curl -fsSLo /usr/local/bin/mitamae https://github.com/itamae-kitchen/mitamae/releases/latest/download/mitamae-aarch64-darwin
else 
    sudo curl -fsSLo /usr/local/bin/mitamae https://github.com/itamae-kitchen/mitamae/releases/latest/download/mitamae-x86_64-darwin
fi

sudo chmod +x /usr/local/bin/mitamae