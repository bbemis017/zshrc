#!/bin/sh

apt-get install zsh

# Installs oh-my-zsh, https://github.com/ohmyzsh/ohmyzsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
