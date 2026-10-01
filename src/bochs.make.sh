#!/usr/bin/env bash
export EM_CACHE="$PWD/emscripten_cache"
export EM_FROZEN_CACHE=0 
export FROZEN_CACHE=0
mkdir -p "$EM_CACHE"

embuilder build sdl2

emconfigure ./configure \
    --enable-x86-64 \
    --enable-cpu-level=6 \
    --enable-all-optimizations \
    --enable-ne2000 \
    --enable-e1000 \
    --without-x \
    --without-x11 \
    --with-sdl2 \
    --disable-docbook \
    --disable-plugins \
    --disable-debugger-gui \
    CFLAGS="-O3 -DNDEBUG -flto -sUSE_SDL=2 -DBX_NETMOD_LINUX=0 -Wno-macro-redefined" CXXFLAGS="-O3 -flto -DNDEBUG -sUSE_SDL=2 -DBX_NETMOD_LINUX=0 -Wno-macro-redefined"

sed -i 's/#define BX_NETMOD_LINUX 1/#define BX_NETMOD_LINUX 0/g' config.h

emmake make -j$(nproc) \
    LDFLAGS="-O3 -flto \
        -sUSE_SDL=2 \
        -sALLOW_MEMORY_GROWTH=1 \
        -sFORCE_FILESYSTEM=1 \
        -sINITIAL_MEMORY=268435456 \
        -sEXIT_RUNTIME=0 \
        -sMINIFY_HTML=0 \
        -sEXPORTED_RUNTIME_METHODS=['FS','callMain'] \
        -sWASM_BIGINT=1 \
        -sASYNCIFY_STACK_SIZE=33554432 \
        -sSTACK_SIZE=33554432 \
        -sASSERTIONS=2 \
        -sASYNCIFY=1 \
        --js-library=jsext/emscripten-pty.js \
        -lidbfs.js \
        -fexceptions"
mv bochs bochs.js