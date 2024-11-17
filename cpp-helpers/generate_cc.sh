#!/bin/bash

if [ ! -d "build_ninja" ]; then
    mkdir build_ninja
fi

cd build_ninja
echo "Generating compile_commands.json..."
cmake -G "Ninja" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..

if [ -f "compile_commands.json" ]; then
    echo "compile_commands.json generated successfully."
    cp compile_commands.json ../build/compile_commands.json
else
    echo "Failed to generate compile_commands.json"
    exit 1
fi

cd ..
