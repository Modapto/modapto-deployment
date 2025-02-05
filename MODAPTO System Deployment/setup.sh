#!/bin/bash

echo "----------------------------------------------"
echo "Setting up MODAPTO System Deployment..."
echo "----------------------------------------------"

# Install Docker and Docker Compose if not available
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Installing Docker..."
    curl -fsSL https://get.docker.com -o install-docker.sh
    sudo sh install-docker.sh
    sudo usermod -aG docker $USER
    rm install-docker.sh
fi

if ! command -v docker-compose &> /dev/null; then
    echo "----------------------------------------------"
    echo "Docker Compose is not installed. Installing Docker Compose..."
    sudo apt-get install -y docker-compose
fi

# Create MODAPTO network
if ! docker network inspect modapto &> /dev/null; then
    echo "----------------------------------------------"
    echo "Creating MODAPTO network..."
    docker network create modapto
fi

# Change permissions to specified files
echo "----------------------------------------------"
echo "Changing permissions to essential files..."
chmod +x /message-bus/scripts/kafka-init-topics-single-broker.sh
chmod 600 /api-gateway/certs/acme.json
chmod +x /production-knowledge-base/setup/entrypoint.sh
chmod +x /production-knowledge-base/setup/lib.sh

# Setup Keycloak to create the Client Secret
echo "----------------------------------------------"
echo "Setting up Keycloak and API Gateway to retrieve Client Token..."
docker compose up -d traefik postgres_db keycloak

# Setup ELK Stack
echo "----------------------------------------------"
echo "Setting up ELK Stack..."s
docker compose up setup