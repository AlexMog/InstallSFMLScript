#!/bin/bash

SCRIPT=$(readlink -f "$0")
BASEDIR=$(dirname "$SCRIPT")

echo "==== Installing SFML2.1 ===="
echo "=> Getting to installation dir..."
cd $BASEDIR
pwd

echo "=> Getting SFML from git..."
git clone https://github.com/LaurentGomila/SFML.git

echo "=> Generating the Makefile..."
mkdir SFML/build
cd SFML/build
cmake -DFREETYPE_INCLUDE_DIRS=/usr/include/freetype2/ ..
echo "=> Compiling the SFML..."
make
[ $? != 0 ] && echo "\t ERROR" && exit 1
echo "=> Installing the SFML..."
sudo make install
[ $? != 0 ] && echo "\t ERROR" && exit 1
cd $BASEDIR
echo "==== SFML installation done ===="