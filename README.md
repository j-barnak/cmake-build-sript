# cmake-build-sript
A simple shell script that builds your project either in debug mode or in release mode. This script also supports will automatically build conan dependencies.

## Instructions

To build in release mode

```
sh ./build.sh release
```

To build in debug  mode

```
sh ./build.sh debug
```

This script uses `ninja-build` to build the project. To change this, omit or change `-GNina` to your liking
