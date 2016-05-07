# Using the build script
------------------------

## Summary

I've provided a build script inside of the scripts directory. The bootstrap
script will symlink this to the root of the docker-cookery repo to make it
easier to run. 

NOTE: You must run the build script from the top level docker-cookery
directory.

## Command Options

  * -v :: *Show version number*
  * -p :: *Specify the recipe directory to build from*
  * -i :: *Optional flag to define custom build container*
  
## Examples

Build using the default container

    ./build -s nginx

Build using custom container called nginx-builder

    ./build -s nginx -i nginx-builder
