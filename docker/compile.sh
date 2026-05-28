#!/bin/bash
rm -rf build subprojects/libblkio
CC=clang meson setup build .
ninja -C build
