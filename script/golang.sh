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

install git

git clone https://github.com/udhos/update-golang
cd update-golang
sudo ./update-golang.sh

cd ..
rm -rf update-golang
