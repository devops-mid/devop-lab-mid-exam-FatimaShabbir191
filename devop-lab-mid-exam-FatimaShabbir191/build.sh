#!/bin/bash

echo "Building the application..."

# Exit immediately if a command fails
set -e  

# Ensure Python and pip are installed
if ! command -v python3 &> /dev/null; then
    echo "Error: Python3 is not installed!"
    exit 1
fi

if ! command -v pip &> /dev/null; then
    echo "Error: pip is not installed!"
    exit 1
fi

# Install dependencies from requirements.txt
if [ -f requirements.txt ]; then
    echo "Installing dependencies from requirements.txt..."
    pip install --upgrade pip  # Ensure pip is updated
    pip install -r requirements.txt
else
    echo "Error: requirements.txt not found!"
    exit 1
fi

# Additional build steps (if needed)
echo "Build process completed successfully!"
