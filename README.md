# Docker // FPM-Cookery

## Overview
A series of shell scripts for automating the building of CentOS  packages using
fpm-cookery inside of Docker containers.

## TL;DR

  * Clone git repo
  * Run scripts/bootstrap
  * Create directory for your package containing recipe.rb and any other deps
  * Run build script (See BUILDING.md)

## Details

This is a set of shell scripts I've written to assist me in building packages
using fpm-cookery and Docker. I've done my best to outline the setup process
so that you can reproduce my environment as easily as possible.

I built these scripts to work on Fedora (specifically F23). If you run another
distribution and run in to issues, check that the utilities and paths that are
called in scripts/bootstrap and scripts/build are the same on your system. YMMV.

### Setup

Clone this git repository somewhere in your home directory (eg. $HOME/git). Once
inside of the repo directory run `scripts/bootstrap`. This will build the docker
container to be used for building your recipes and create a symlink in the
top level of the git repository for scripts/build. Once `scripts/bootstrap`
completes, create a directory (eg. for nginx: ~/git/docker-cookery/nginx) for
your recipe. Create your recipe.rb file inside of this directory. Provide any
dependencies your recipe requires here as well. From the docker-cookery root
directory run `build -p <relative_recipe_dir_name>`. Once complete, you should
have a "pkg" directory inside of the recipe directory containing your rpm.

### Caveats

  * It's currently not possible to run `build` from within a specific recipe dir.
    - I would like to fix this down the road

## TODO

  * Add support for bootstrapping specific OS based build containers
    - Currently, `build` supports alternate containers with the `build -i` flag
    but the bootstrap script can not set them up for you automatically.
