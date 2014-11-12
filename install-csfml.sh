#!/bin/bash

SCRIPT=$(readlink -f "$0")
BASEDIR=$(dirname "$SCRIPT")

echo "==== Installing CSFML2.1 ===="
echo "=> Getting to installation dir..."
cd $BASEDIR
pwd

echo "=> Getting CSFML from git..."
git clone https://github.com/LaurentGomila/CSFML.git

echo "=> Generating the Makefile..."
mkdir CSFML/build
cd CSFML/build
cmake .. -DFREETYPE_INCLUDE_DIRS=/usr/include/freetype2/ -DCMAKE_MODULE_PATH=$BASEDIR/SFML/cmake/Modules/
echo "=> Compiling the CSFML..."
make
[ $? != 0 ] && echo "    ERROR" && exit 1
echo "=> Installing the CSFML..."
sudo make install
[ $? != 0 ] && echo "     ERROR" && exit 1
cd $BASEDIR
echo "==== CSFML installation done ===="