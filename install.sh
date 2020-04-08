#!/bin/sh

# export required variable for deploy script
export ZSHRC_SRC_DIR=.;

sudo apt-get update
yes | sudo ./install_shell.sh 
./deploy.sh

yes | sudo ./install_python_dev.sh
yes | sudo ./install_docker_cli.sh
yes | sudo ./install_docker_compose.sh
yes | sudo ./install_nodejs_dev.sh
