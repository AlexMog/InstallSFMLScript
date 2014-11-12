#!/bin/bash

libs="libpthread-stubs
mesa-devel
libx11-devel
libxrandr-devel
libfreetype6-devel
libglew1.5
libjpeg8-devel
libsndfile1-devel
libopenal-devel
cmake
g++"

command -v apt-get >/dev/null 2>&1 || {
    echo "Command 'apt-get' not found. You need to install libs yourself. Libs to install:"
    for lib in $libs
    do
	echo "=> $lib"
    done
    exit 1
}

sudo apt-get update

for lib in $libs
do
    sudo apt-get install $lib
    [ $? == 100 ] && echo "ERROR: Impossible to install $lib" && exit 1
done

exit 0