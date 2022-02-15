#! /bin/bash

curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

# install exa util for listing files (check : config.fish)
cargo install exa
