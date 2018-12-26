datadir=/blockchain/bitcoin
txindex=1
server=1
rpcuser=esyscmd(`openssl rand -hex 16')rpcpassword=esyscmd(`openssl rand -hex 16')
### set up tor-control password hash by running 'tor --hash-password "<PASSWORD>"'
### and enable tor control interface for this hash in /etc/tor/torrc
# torcontrol=127.0.0.1:9051
# torpassword= xxx
#listenonion=1

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
