#!/bin/bash

# If a step fails, exit with non-zero code
set -e

# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

DOCKER_COMPOSE_VERSION=1.7.1

# Update Ubuntu
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade

# Install Docker
curl -sSL https://get.docker.com/ | sudo sh

# Install Docker Compose
sudo curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Run Docker Compose
git clone https://github.com/criticalmaps/criticalmaps-api.git
cd criticalmaps-api
docker-compose -f docker-compose.production.yml up -d
