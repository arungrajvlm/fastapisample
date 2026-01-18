#!/bin/bash
set -e

# Update system
sudo yum update -y
sudo yum install git python3 -y

# Navigate to home
cd /home/ec2-user

# Clone repository (replace with your actual repo URL if different)
# If directory exists, pull latest
if [ -d "fastapisample" ]; then
    echo "Directory exists, pulling changes..."
    cd fastapisample
    git pull
else
    echo "Cloning repository..."
    git clone https://github.com/arungrajvlm/fastapisample.git
    cd fastapisample
fi

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

source venv/bin/activate

# Install dependencies
echo "Installing dependencies..."
pip install -r requirements.txt

# Setup Systemd service
echo "Setting up systemd service..."
sudo cp deployment/fastapi.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable fastapi
sudo systemctl restart fastapi

echo "Deployment complete! Application should be running on port 8000."
echo "Check status with: sudo systemctl status fastapi"
