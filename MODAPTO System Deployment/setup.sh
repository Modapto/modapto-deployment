#!/bin/bash 

echo "----------------------------------------------"
echo "Setting up MODAPTO System Deployment..."
echo "----------------------------------------------"

# Install Docker and Docker Compose if not available
echo "Checking if Docker and Docker Compose are installed.."
echo "----------------------------------------------"
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Installing Docker..."
    curl -fsSL https://get.docker.com -o install-docker.sh
    sudo sh install-docker.sh
    sudo usermod -aG docker $USER
    rm install-docker.sh
else
    echo "Docker is already installed.."
fi

if ! command -v docker-compose &> /dev/null; then
    echo "----------------------------------------------"
    echo "Docker Compose is not installed. Installing Docker Compose..."
    sudo apt-get install -y docker-compose
else
    echo "Docker Compose is already installed.."
fi

# Create MODAPTO network
echo "----------------------------------------------"
echo "Creating MODAPTO network..."
if ! docker network inspect modapto &> /dev/null; then
    echo "----------------------------------------------"
    docker network create modapto
    echo "Network created successfully!"
else
    echo "Network already exists.."
fi

# Change permissions to specified files
echo "----------------------------------------------"
echo "Changing permissions to essential files..."
chmod 777 ./api-gateway/certs
chmod 777 ./api-gateway/config
chmod +x ./message-bus/scripts/kafka-init-topics-single-broker.sh
chmod 700 ./message-bus/mqtt-config/passwd
chmod 600 ./api-gateway/certs/acme.json
chmod +x ./production-knowledge-base/setup/entrypoint.sh
chmod +x ./production-knowledge-base/setup/lib.sh

# Starting API Gateway
echo "----------------------------------------------"
echo "Starting API Gateway component.."
docker compose --profile proxy up traefik

# Setup Keycloak to create the Client Secret
echo "----------------------------------------------"
echo "Setting up Keycloak and API Gateway to retrieve Client Token..."
docker compose up -d postgres_db keycloak

# Setup ELK Stack
echo "----------------------------------------------"
echo "Setting up ELK Stack..."
docker compose up setup