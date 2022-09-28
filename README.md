# cmake-build-sript

* Simple shell script that build your project either in debug mode or in release mode
* Will generate the necessary conan recipe and requirements as well as generate the build files for cmake
* Creates `compile_commands.json` for LSPs
* Uses the ninja build system
    * To change, omit `-GNinja` from the script

## Instructions
Make sure to the script in the top level directory of your project.

To build in release mode:

```
sh ./build.sh release
```

To build in debug mode:

```
sh ./build.sh debug
```
