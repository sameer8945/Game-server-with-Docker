#!/bin/bash

set -e

apt-get update
apt-get upgrade -y

# Install Docker
apt-get install -y docker.io

# Start Docker
systemctl enable docker
systemctl start docker

# Install Docker Compose
apt-get install -y docker-compose-v2

# Create Minecraft directory
mkdir -p /opt/minecraft

# Create Docker Compose file
cat <<'EOF' > /opt/minecraft/docker-compose.yml
${docker_compose}
EOF