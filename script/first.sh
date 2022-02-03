#! /bin/bash

sudo apt update

function install {
        which $1 &> /dev/null

        if [ $? -ne 0 ]; then
                echo "Install: ${1}..."
                sudo apt install -y $1
        else
                echo "Already installed: ${1}"
        fi
}

install open-vm-tools-desktop
install ranger
install stow
