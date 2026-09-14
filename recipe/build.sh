#!/bin/bash

mkdir build && cd build

cmake ${CMAKE_ARGS} \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_INCLUDEDIR=include \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DBUILD_STATIC_LIBS=OFF \
    -DBUILD_SHARED_LIBS=ON \
    ..
make -j${CPU_COUNT}
# remove two tests which need to download data
ctest -E "check_szcomp|sampledata.sh"
make install
