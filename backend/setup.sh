#!/bin/bash

# Update package lists and install prerequisites
echo "Updating system package list..."
sudo apt-get update -y

# Install Python3 and pip if not installed
if ! command -v python3 &> /dev/null
then
    echo "Python3 not found. Installing Python3..."
    sudo apt-get install python3 -y
else
    echo "Python3 is already installed."
fi

if ! command -v pip3 &> /dev/null
then
    echo "pip3 not found. Installing pip3..."
    sudo apt-get install python3-pip -y
else
    echo "pip3 is already installed."
fi

# Install Docker if not installed
if ! command -v docker &> /dev/null
then
    echo "Docker not found. Installing Docker..."
    sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
    sudo apt-get update -y
    sudo apt-get install docker-ce -y
    sudo systemctl start docker
    sudo systemctl enable docker
else
    echo "Docker is already installed."
fi

# Build Docker images for each service
echo "Building Docker images for the services..."

docker build -t product-service ./product_service
docker build -t order-service ./order_service
docker build -t payment-service ./payment_service

# Run Docker containers
echo "Running Docker containers for the services..."

docker run -d -p 5001:5001 --name product-service-container product-service
docker run -d -p 5002:5002 --name order-service-container order-service
docker run -d -p 5003:5003 --name payment-service-container payment-service

echo "Services are up and running on ports 5001, 5002, and 5003."
