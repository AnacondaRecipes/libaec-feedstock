@echo ON
setlocal enabledelayedexpansion

mkdir build
cd build

cmake -LAH -G "Ninja"                                                     ^
    -DCMAKE_BUILD_TYPE="Release"                                          ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX%                               ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX%                                  ^
    -DBUILD_SHARED_LIBS=1                                                 ^
    ..

if errorlevel 1 exit 1

ninja install -j%CPU_COUNT%
if errorlevel 1 exit 1
