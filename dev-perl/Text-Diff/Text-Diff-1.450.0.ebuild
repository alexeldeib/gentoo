# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DIST_AUTHOR=NEILB
DIST_VERSION=1.45
inherit perl-module

DESCRIPTION="Perform diffs on files and record sets"

SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 ~m68k ~mips ppc ppc64 s390 ~sh sparc x86 ~ppc-aix ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

RDEPEND="
	>=dev-perl/Algorithm-Diff-1.190.0
	virtual/perl-Exporter
"
DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
"
PERL_RM_FILES=( "t/97_meta.t" "t/98_pod.t" "t/99_pmv.t" )
