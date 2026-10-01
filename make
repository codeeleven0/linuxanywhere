#!/usr/bin/env bash
cd bootstrap
cd bochs
mkdir -p ../../dist
bash ../../src/bochs.make.sh
cp -r ../node_modules ../../dist/
cp ../../src/html/index.html ../../dist/
cp bochs.js ../../dist
cp bochs.wasm ../../dist
cp bios/BIOS-bochs-latest ../../dist/bios.bin
cp bios/VGABIOS-lgpl/VGABIOS-lgpl-latest.bin ../../dist/vgabios.bin