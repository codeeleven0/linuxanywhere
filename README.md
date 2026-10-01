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
