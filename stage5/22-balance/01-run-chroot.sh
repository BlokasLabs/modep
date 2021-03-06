#!/bin/bash -e

exit # No gui
PLUGIN=balance.lv2
GIT_URI="https://github.com/BlokasLabs/${PLUGIN}"
TMP_DIR=/tmp/${PLUGIN}

rm -rf ${TMP_DIR}
git clone ${GIT_URI} ${TMP_DIR}
pushd ${TMP_DIR}

export CC=arm-linux-gnueabihf-gcc
export CXX=arm-linux-gnueabihf-g++
export LD=arm-linux-gnueabihf-gcc
export STRIP=arm-linux-gnueabihf-strip

export BUILDOPENGL=no
export BUILDGTK=no
export HAVE_UI=no
export OPTIMIZATIONS=
export MOD=1
export LV2DIR=${LV2_DIR}

make -j4
make install 

popd

rm -rf ${TMP_DIR}

