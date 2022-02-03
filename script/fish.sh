#! /bin/bash
 
function install {
        which $1 &> /dev/null
 
        if [$? -ne 0 ]; then
                echo "Install: ${1}..."
                sudo apt install -y $1
        else
                echo "Already installed: ${1}"
        fi
}

sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish

chsh -s /usr/bin/fish

# install omf
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

