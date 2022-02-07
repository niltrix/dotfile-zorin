#! /bin/bash

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
sudo ln -s ~/.local/kitty.app/bin/kitty /usr/bin/kitty
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/kitty 99
sudo update-alternatives --config x-terminal-emulator

# color theme
git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes

ln -s ~/.config/kitty/kitty-themes/themes/Neutron.conf ~/.config/kitty/theme.conf

cd ..
stow --target=$HOME kitty
