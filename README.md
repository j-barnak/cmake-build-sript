# cmake-build-sript

* Simple shell script thuilds your project either in debug mode or in release mode
* Supports will automatically build conan dependencies
* Create `compile_commands.json` for LSPs

## Instructions
Run the script in the top level directory of your project

To build in release modeLr

```
sh ./build.sh release
```

To build in debug mode:

```
sh ./build.sh debug
```

This script uses `ninja-build` to build the project. To change this, omit or change `-GNina` to your liking
