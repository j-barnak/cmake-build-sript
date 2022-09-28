#!/usr/bin/bash

# Usage: build.sh debug
if [ "$1"  = "debug" ]
then
    if [ ! -d "debug" ]; then
        mkdir debug
    fi

    if [ -f "conanfile.txt" ] || [ -f "conanfile.py" ]; then
        conan install . --install-folder debug -pr:b=default --build=missing -s build_type=Debug
    fi

    cmake -B debug -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake . -GNinja
    mv debug/compile_commands.json .

#Usage: build.sh release
elif [ "$1"  = "release" ]
then
    if [ ! -d "release" ]; then
        mkdir release
    fi

    if [ -f "conanfile.txt" ] || [ -f "conanfile.py" ]; then
        conan install . --install-folder debug -pr:b=default --build=missing -s build_type=Release        
    fi
    
    cmake -B debug -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake . -GNinja

    cmake -B release -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=1 . -GNinja
    mv release/compile_commands.json .

else
    echo "To build in debug:  ./build debug"
    echo "To build in relase: ./build release"
fi
