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

* creates bitcoind.service, installs and enables & runs
* places config files into /etc/bitcoin/bitcoin.conf
* generates random rpcuser & rpcpassword using `openssl rand -hex 16` (you need to copy the 2 lines into ~/.bitcoin/bitcoin.conf in order to use bitcoin-cli utility)
* creates user 'bitcoin', group 'bitcoin' and 'crypto'
* bitcoin home dir is in /blockchain/bitcoin

usage:
1. prepare directory at `/blockchain` with at least 300GB free space
2. build project
```
$ git clone https://github.com/jakubtrnka/ArchLinux_BitcoinCore
$ cd ArchLinux_BitcoinCore
$ makepkg -sri
```
3. enable & start bitcoind.service: `systemctl enable bitcoind`...
4. [optional] copy RPC credentials to your home bitcoin directory in order to use bitcoin-cli:
```
$ mkdir ~/.bitcoin
$ egrep 'rpc(user|password)' pkg/bitcoin-core/etc/bitcoin/bitcoin.conf > ~/.bitcoin/bitcoin.conf
$ chmod 600 ~/.bitcoin/bitcoin.conf
```
5. [optional] set up Tor by creating Tor control password and opening Tor control port as described in bitcoin.conf
