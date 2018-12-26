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

MAKEFLAGS="-j$((($(nproc)+1)/2))"

source=("bitcoin-$pkgver.tgz::https://github.com/bitcoin/bitcoin/archive/v$pkgver.tar.gz")
sha256sums=('d51bae80fc0a460ce752d04097c4a1271a66b55260d53165d82313488117d290')

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
	make -k check
}

package() {
	cd bitcoin-$pkgver
	make DESTDIR="$pkgdir" install
}
