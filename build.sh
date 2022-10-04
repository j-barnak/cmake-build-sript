#!/usr/bin/bash

# Usage: build.sh debug
if [ "$1"  = "debug" ] || [ "$1"  = "d" ]; then

    if [ ! -d "debug" ]; then
        mkdir debug
    fi

    if [ -f "conanfile.txt" ] || [ -f "conanfile.py" ]; then
        conan install . --install-folder debug -pr:b=default --build=missing -s build_type=Debug
        cmake -B debug -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake . -GNinja

    else
        # Omit -GNina from the following line to generate different build files (e.g., if you want to use Makefiles)
        cmake -B debug -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1 . -GNinja
    fi

    mv debug/compile_commands.json .

# Usage: build.sh release
elif [ "$1"  = "release" ] || [ "$1"  = "r" ]; then

    if [ ! -d "release" ]; then
        mkdir release
    fi

    if [ -f "conanfile.txt" ] || [ -f "conanfile.py" ]; then
        conan install . --install-folder release -pr:b=default --build=missing 
        cmake -B release -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake . -GNinja
    
    else
        # Omit -GNina from the following line to generate different build files (e.g., if you want to use Makefiles)
        cmake -B release -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=1 . -GNinja
    fi

    mv release/compile_commands.json .

elif [ "$1"  = "build" ] || [ "$1"  = "b" ]; then

    if [ -d "release" ]; then
        cmake --build release/

    elif [ -d "debug" ]; then
        cmake --build debug/ 
    fi

else
    echo "To build in debug:  sh ./build.sh debug"
    echo "To build in relase: sh ./build.sh release"
fi
