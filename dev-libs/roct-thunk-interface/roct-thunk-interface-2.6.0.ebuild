# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils linux-info

if [[ ${PV} == *9999 ]] ; then
	EGIT_REPO_URI="https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface/"
	inherit git-r3
else
	SRC_URI="https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface/archive/roc-${PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/ROCT-Thunk-Interface-roc-${PV}"
	KEYWORDS="~amd64"
fi
PATCHES=(
	"${FILESDIR}/${P}-correctly-install.patch"
	"${FILESDIR}/${P}-correctly-install-pc.patch"
	"${FILESDIR}/${P}-pc-prefix.patch"
	"${FILESDIR}/${P}-do-not-install-kfd_ioctl.h.patch"
)

DESCRIPTION="Radeon Open Compute Thunk Interface"
HOMEPAGE="https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface"
CONFIG_CHECK="~HSA_AMD"
LICENSE="MIT"
SLOT="0/$(ver_cut 1-2)"

RDEPEND="sys-process/numactl
	sys-apps/pciutils"
DEPEND="${RDEPEND}"

src_prepare() {
	sed -e "s:get_version ( \"1.0.0\" ):get_version ( \"${PV}\" ):" -i CMakeLists.txt || die
	cmake-utils_src_prepare
}
src_compile() {
	cmake-utils_src_compile build-dev
}
src_install() {
	cmake-utils_src_install install-dev
}
