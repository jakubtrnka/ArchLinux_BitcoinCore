# Arch Linux Bitcoin Core
Archlinux package builder

Downloads sources from https://github.com/bitcoin/bitcoin/archive/v0.17.1.tar.gz and compiles

* BerkeleyDB 4.8 is compiled and linked statically
* ZeroMQ is enabled
* GUI is disabled

ZMQ configs:
```
[main]
zmqpubrawblock=tcp://127.0.0.1:28332
zmqpubrawtx=tcp://127.0.0.1:28333
maxuploadtarget=20000

[test]
zmqpubrawblock=tcp://127.0.0.1:38332
zmqpubrawtx=tcp://127.0.0.1:38333

[regtest]
zmqpubrawblock=tcp://127.0.0.1:48332
zmqpubrawtx=tcp://127.0.0.1:48333
```

* creates bitcoind.service, installs and enable+run
* places config files into /etc/bitcoin/bitcoin.conf
* creates user 'bitcoin', group 'bitcoin' and 'crypto'
* bitcoin home dir is in /blockchain/bitcoin

usage:
```
$ git clone https://github.com/jakubtrnka/ArchLinux_BitcoinCore
$ cd ArchLinux_BitcoinCore
$ makepkg -sri
```
