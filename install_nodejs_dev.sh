#!/bin/sh


# register yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

apt-get update

# install nodejs 13
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
apt-get install nodejs


# install yarn
apt-get install yarn
