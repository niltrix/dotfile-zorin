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

install tmux

# go to home directory
cd
# get my oh-my-tmux forked from https://github.com/gpakosz/.tmux.git
git clone https://github.com/niltrix/.tmux.git
ln -s -f .tmux/.tmux.conf

