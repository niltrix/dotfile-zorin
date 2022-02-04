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

function sha256 {
    printf '%s %s\n' "$1" "$2" | sha256sum --check
}

install libgl1-mesa-glx
install libegl1-mesa
install libxrandr2
install libxss1
install libxcursor1
install libxcomposite1
install libasound2
install libxi6
install libxtst6

wget -c https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh
sha256 fedf9e340039557f7b5e8a8a86affa9d299f5e9820144bd7b92ae9f7ee08ac60 Anaconda3-2021.11-Linux-x86_64.sh

bash Anaconda3-2021.11-Linux-x86_64.sh
~/anaconda3/condabin/conda init fish

rm Anaconda3-2021.11-Linux-x86_64.sh


