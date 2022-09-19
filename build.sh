#!/usr/bin/bash

if [ "$1"  = "debug" ]
then
    if [ ! -d "debug" ]; then
        mkdir debug
    fi

    cmake -B debug -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1 . -GNinja
    cd debug/
    ninja
    cd -

elif [ "$1"  = "release" ]
then
    if [ ! -d "release" ]; then
        mkdir release
    fi

    cmake -B release -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=1 . -GNinja
    cd release/
    ninja
    cd -

else
    echo "To build in debug:  ./build debug"
    echo "To build in relase: ./build release"
fi
