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

git clone https://github.com/udhos/update-golang
cd update-golang
sudo ./update-golang.sh

cd ..
rm -rf update-golang
