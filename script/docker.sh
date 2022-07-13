#! /bin/bash

DISTRO=$(grep '^ID_LIKE' /etc/os-release | sed 's/ID_LIKE=//')
PM_UPDATE=
PM_INSTALL=
if [ "arch" = "$DISTRO" ]; then
  echo "arch...use pacman"
  PM_UPDATE="sudo pacman -Sy"
  PM_INSTALL="sudo pacman -S --noconfirm"
elif [ "ubutu" = "$DISTRO" ]; then
  echo "arch...use apt"
  PM_UPDATE="sudo apt update"
  PM_INSTALL="sudo apt install -y"
else
  echo "$DISTRO is Not supported"
fi

$PM_UPDATE

function install {
        which $1 &> /dev/null

        if [ $? -ne 0 ]; then
                echo "Install: ${1}..."
                $PM_INSTALL $1
        else
                echo "Already installed: ${1}"
        fi
}

install ca-certificates
install curl
install gnupg
install lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

$PM_UPDATE

install docker-ce
install docker-ce-cli
install containerd.io

sudo usermod -aG docker ${USER}
