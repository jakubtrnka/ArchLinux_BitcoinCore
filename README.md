# Arch Linux Bitcoin Core
Archlinux package builder

Downloads sources from https://github.com/bitcoin/bitcoin/archive/v0.17.1.tar.gz and compiles

* BerkeleyDB 4.8 is compiled and linked statically
* ZeroMQ is enabled
* GUI is disabled

usage:
```
$ git clone https://github.com/jakubtrnka/ArchLinux_BitcoinCore
$ cd ArchLinux_BitcoinCore
$ makepkg -sri
```
