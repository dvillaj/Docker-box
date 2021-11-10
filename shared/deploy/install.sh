#!/bin/bash

function createSwapMemory {
    echo "Creating Swap Memory ..."

    fallocate -l 2G /swapfile
    chmod 600 /swapfile
    mkswap /swapfile
    swapon /swapfile
}


function installDocker {
    echo "Installing docker ..."
   
    apt install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
    apt install -qq -y docker-ce docker-compose

    usermod -aG docker vagrant
}

function installGlances {
    echo "Installing Glances ..."
   
    apt install -y glances
}


echo "Setting up Docker box ..."

createSwapMemory
installDocker