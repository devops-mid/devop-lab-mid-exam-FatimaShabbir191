#!/bin/bash

echo "Running tests..."

# Exit on first failure
set -e  

# Ensure pytest is installed
if ! command -v pytest &> /dev/null; then
    echo "pytest not found, installing..."
    pip install pytest
fi

# Run all tests from the tests/ directory
if [ -d "tests" ]; then
    echo "Running all tests in the 'tests/' directory..."
    pytest tests/ --verbose
else
    echo "Error: 'tests/' directory not found!"
    exit 1
fi

echo "All tests completed successfully!"
