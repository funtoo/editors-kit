# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A complete text editor for your terminal"
HOMEPAGE="https://github.com/jmacdonald/amp"
SRC_URI="https://github.com/jmacdonald/amp/tarball/dae913c95d72fd6f8c1b557e7a8c4a0ffb3b057e -> amp-0.7.1-dae913c.tar.gz
https://direct.funtoo.org/8d/00/06/8d0006c634294644a05dcc9b4efd26811344dfb1c17e8f6bbd82a9f16520bbde65f67bb77cc1c706cae7d9ea6dffd21c11509e83a1701cb77908c625d43d64ec -> amp-0.7.1-funtoo-crates-bundle-27000f15d6b6d67800d3fa2c89e1abc6b4bc3c171b6352862ea830001938523ba7b57ede126e781a8c757eb629649bdce9f7b43d833c379339ca42eb89ed571f.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE="X"

BDEPEND="
	virtual/rust
	dev-util/cmake
"

RDEPEND="
	dev-vcs/git
	X? ( x11-libs/libxcb )
	dev-libs/openssl
	sys-libs/zlib
"

post_src_unpack() {
	mv ${WORKDIR}/jmacdonald-amp-*/* ${S} || die
}

src_install() {
	cargo_src_install
	dodoc README.md
}