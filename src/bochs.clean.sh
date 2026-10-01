#!/usr/bin/env bash
rm -fr emscripten_cache
rm -fr *.wasm *.html *.js
emmake make distclean