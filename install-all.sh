#!/bin/bash

echo "===================================================="
echo "======= Installation of SFML2.1 and CSFML2.1 ======="
echo "=======   Script made by AlexMog (moghra_a)  ======="
echo "=======     contact: moghra_a@epitech.eu     ======="
echo "===================================================="

CLEANDIR=0

read -n1 -r -p "=> Do you want to clean the directory after installation? (Y/n)" clean
case $clean in
    [yY][eE][sS]|[yY])
	CLEANDIR=1;;
    *)
	;;
esac

echo ""

INSTALLDEP=0

read -n1 -r -p "=> Installer les dépendances? (Y/n)" installdep
case $installdep in
    [yY][eE][sS]|[yY])
	INSTALLDEP=1;;
    *)
	;;
esac

echo ""

SCRIPT=$(readlink -f "$0")
BASEDIR=$(dirname "$SCRIPT")

echo "==== Installing all the packages for CSFML and SFML ===="
cd $BASEDIR

echo "=> Setting rights..."
chmod +x ./install-sfml.sh
chmod +x ./install-csfml.sh
chmod +x ./install-libs.sh

if [ $INSTALLDEP == 1 ];
then
    echo "==== Installing dependencies ===="
    ./install-libs.sh
    [ $? != 0 ] && echo "    Aborting install." && exit 1
fi

./install-sfml.sh
[ $? != 0 ] && echo "Aborting SFML install." && exit 1
./install-csfml.sh
[ $? != 0 ] && echo "Aborting CSFML install." && exit 1

cd $BASEDIR

if [ $CLEANDIR == 1 ];
then
    echo "==== Cleaning installation directory ===="
    rm -irf $BASEDIR/CSFML
    rm -irf $BASEDIR/SFML
fi

echo "==== Installation ended with success ===="