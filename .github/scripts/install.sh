#!/usr/bin/env bash

# Modified version of this gist: https://gist.github.com/Adron/90863e51c8c5c0ad2049890bcd8abbfb 
# sudo apt-get install jq
# # Get URLs for most recent versions
# terraform_url=$(curl --silent https://releases.hashicorp.com/index.json | jq '{terraform}' | egrep "linux.*64" | sort -rh | head -1 | awk -F[\"] '{print $4}')
# packer_url=$(curl --silent https://releases.hashicorp.com/index.json | jq '{packer}' | egrep "linux.*64" | sort -rh | head -1 | awk -F[\"] '{print $4}')
echo 'updating repo'
apt-get update

echo 'installing zip unzip'
apt-get install zip unzip

echo 'setting url'
packer_url="https://releases.hashicorp.com/packer/1.6.6/packer_1.6.6_linux_amd64.zip"

# Create a move into directory.
cd
mkdir packer && cd $_
# mkdir terraform && cd $_

# Download Terraform. URI: https://www.terraform.io/downloads.html
# curl -o terraform.zip $terraform_url
# # Unzip and install
# unzip terraform.zip

# Change directory to Packer
cd ~/packer

# Download Packer. URI: https://www.packer.io/downloads.html
curl -o packer.zip $packer_url
# Unzip and install
unzip packer.zip

mv ./packer /usr/local/bin/

echo 'present directory'
ls -lart

ls /usr/local/bin/

echo "$PWD"

echo 'ls -lart'
