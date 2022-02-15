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

install git
install htop
install neofetch
install open-vm-tools-desktop
install ranger
install stow
install direnv
install autojump

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
