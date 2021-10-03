#!/usr/bin/env bash

set -x

main() {
    mkdir -p /tmp/ps2/binutils /tmp/ps2/build

    curl --retry 3 -sSfL "https://ftp.gnu.org/gnu/binutils/binutils-2.36.tar.gz" -O
    tar -C /tmp/ps2/binutils --strip-components=1 -xf "binutils-2.36.tar.gz"

    cd /tmp/ps2

    cd build
    ../binutils/configure --target=mips64el-none-elf
    make "-j$(nproc)"
    make install
    cd ..

    rm -rf /tmp/ps2
}

main "${@}"
