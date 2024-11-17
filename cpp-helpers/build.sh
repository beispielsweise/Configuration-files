#!/bin/bash

if [ ! -d "build" ]; then
    echo "Creating build directory..."
    mkdir build
fi
cd build

# Building...
echo "Building..."
cmake ..
cmake --build .

# Check if Debug or Release executable exists and run it
if [ -f "Debug/run" ]; then
    echo "Running Debug build..."
    ./Debug/run
elif [ -f "Release/run" ]; then
    echo "Running Release build..."
    ./Release/run
else
    echo "Error: Executable not found."
fi
