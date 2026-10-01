# linuxanywhere
run linux!? on your web browser!

# how does this work?
we utilize bochs, a system emulator to run x86_64 linux environments. its compiled using emscripten to make it executable in browsers. 

# caveats
- internet access not working (but e1000 driver and internal dhcp is working)
- no serial terminal access (if that works i can work out a multiplexer to gain multi-session access)
- boot of tiny core (64-bit) takes 2 minutes on x64 windows firefox
- speed (mips) is really low
- permanent storage not yet implemented

# building 
- you will need emscripten sdk installed

run `./prepare` to fetch the bootstrap. then run `./make` to create the `dist/` folder that contains the application. (the dist folder is pushed on purpose to this repository)<br>

the build takes approx. 5 minutes to complete (LTO enabled with -O3, builds will take longer)

# running the demo

go to [https://codeeleven0.github.io/linuxanywhere/dist](https://codeeleven0.github.io/linuxanywhere/dist) to see the demo.

# what is next
- better optimization
- snapshot loading for fixed VMs
- networking proxy
- serial and terminal multiplexer
- an interconnect daemon
- better and lighter linux kernel and rootfs (alpine virt?)
- a library that connects all