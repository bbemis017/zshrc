#!/bin/sh

# replace bashrc with file that points to zsh
cp ${ZSHRC_SRC_DIR}/.bashrc ~/.bashrc

# Update zshrc in root
cp ${ZSHRC_SRC_DIR}/.zshrc ~/.zshrc

cp ${ZSHRC_SRC_DIR}/wsl.conf /etc/wsl.conf
