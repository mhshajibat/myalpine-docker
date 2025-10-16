#!/bin/bash

# Make sure Dockerfile exists
if [ ! -f Dockerfile ]; then
    echo "Dockerfile not found!"
    exit 1
fi

# Build the custom Alpine image
sudo docker build -t myalpine:latest .

# Test run
sudo docker run --rm myalpine:latest

