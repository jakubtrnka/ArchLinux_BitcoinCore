# Maintainer: Jakub Trnka <jakub.trnka@chainanalytics.net>
pkgname='bitcoin-core'
pkgver=0.17.1
pkgrel=1
conflicts=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-tx')
arch=('x86_64')
pkgdesc="Headless version of Bitcoin Core software ready to run as backend for other services, e. g. Lightning-network."
license=('MIT')
url="https://www.bitcoin.org/"
depends=('boost-libs' 'libevent' 'miniupnpc' 'zeromq')
makedepends=('boost' 'python')
optdepends=('tor')

install=bitcoin-core.install

MAKEFLAGS="-j$((($(nproc)+1)/2))"

source=("bitcoin-$pkgver.tgz::https://github.com/bitcoin/bitcoin/archive/v$pkgver.tar.gz"
	"bitcoin.conf.gen.m4"
	"bitcoind.service")
sha256sums=('d51bae80fc0a460ce752d04097c4a1271a66b55260d53165d82313488117d290'
            '027ca9fea5d2afe34af7e6e82dac0e5468cc2831111b5b0b7770da0d012517d3'
            '8d892ba81d45443e7338d9137894990d38be6a3ab8a108a4d068e7a635900e7a')

prepare() {
	cd bitcoin-$pkgver
	./autogen.sh
	./contrib/install_db4.sh `pwd`
}

build() {
	cd bitcoin-$pkgver
	export BDB_PREFIX="$srcdir/bitcoin-$pkgver/db4"
	./configure BDB_LIBS="-L${BDB_PREFIX}/lib -ldb_cxx-4.8" BDB_CFLAGS="-I${BDB_PREFIX}/include" --prefix=/usr --with-gui=no
	make
}

check() {
	cd bitcoin-$pkgver
	#make -k check
}

package() {
	m4 bitcoin.conf.gen.m4 > bitcoin.conf
	cd bitcoin-$pkgver
	make DESTDIR="$pkgdir" install
	install -D ../bitcoind.service $pkgdir/usr/lib/systemd/system/bitcoind.service
	install -Dm 600 ../bitcoin.conf $pkgdir/etc/bitcoin/bitcoin.conf
}

