#! /bin/bash

sudo apt update

function install {
	which $1 &> /dev/null

	if [$? -ne 0 ]; then
		echo "Install: ${1}..."
		sudo apt install -y $1
	else
		echo "Already installed: ${1}"
	fi
}

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

sudo mv nvim.appimage /usr/bin/nvim

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 99 
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 99
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 99
