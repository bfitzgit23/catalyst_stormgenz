# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

BASE_PACKAGENAME="bin"
BASE_AMD64_URI="https://tamiko.43-1.org/distfiles/amd64-${BASE_PACKAGENAME}-"
BASE_X86_URI="https://tamiko.43-1.org/distfiles/x86-${BASE_PACKAGENAME}-"

PYTHON_COMPAT=( python3_11 )
PYTHON_REQ_USE="xml(+)"

inherit java-pkg-opt-2 python-single-r1 prefix toolchain-funcs xdg-utils

DESCRIPTION="A full office productivity suite. Binary package"
HOMEPAGE="https://www.libreoffice.org"
SRC_URI_AMD64="
	${BASE_AMD64_URI}libreoffice-${PVR}.tar.xz
	kde? (
		!java? ( ${BASE_AMD64_URI}libreoffice-kde-${PVR}.xd3 )
		java? ( ${BASE_AMD64_URI}libreoffice-kde-java-${PVR}.xd3 )
	)
	gnome? (
		!java? ( ${BASE_AMD64_URI}libreoffice-gnome-${PVR}.xd3 )
		java? ( ${BASE_AMD64_URI}libreoffice-gnome-java-${PVR}.xd3 )
	)
	!kde? ( !gnome? (
		java? ( ${BASE_AMD64_URI}libreoffice-java-${PVR}.xd3 )
	) )
"
SRC_URI_X86="
	${BASE_X86_URI}libreoffice-${PVR}.tar.xz
	kde? (
		!java? ( ${BASE_X86_URI}libreoffice-kde-${PVR}.xd3 )
		java? ( ${BASE_X86_URI}libreoffice-kde-java-${PVR}.xd3 )
	)
	gnome? (
		!java? ( ${BASE_X86_URI}libreoffice-gnome-${PVR}.xd3 )
		java? ( ${BASE_X86_URI}libreoffice-gnome-java-${PVR}.xd3 )
	)
	!kde? ( !gnome? (
		java? ( ${BASE_X86_URI}libreoffice-java-${PVR}.xd3 )
	) )
"

SRC_URI="
	amd64? ( ${SRC_URI_AMD64} )
	x86? ( ${SRC_URI_X86} )
"

IUSE="gnome java kde"
LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="-* amd64 x86"

BIN_COMMON_DEPEND="
	app-text/hunspell:0/1.7
	=app-text/libexttextcat-3.4*
	=app-text/libmwaw-0.3*
	dev-cpp/abseil-cpp:0/20230125
	dev-libs/boost:0/1.82.0
	dev-libs/icu:0/73.1
	dev-libs/liborcus:0/0.17
	dev-libs/xmlsec:0/1.3
	>=media-gfx/graphite2-1.3.10
	media-libs/harfbuzz:0/6.0.0[icu]
	media-libs/libjpeg-turbo:0/0.2
	media-libs/libpng:0/16
	media-libs/openjpeg:2/7
	media-libs/zxing-cpp:0/3
	sci-mathematics/lpsolve:0/55
	>=sys-devel/gcc-12.3.1
	>=sys-libs/glibc-2.37
"

# PLEASE place any restrictions that are specific to the binary builds
# into the BIN_COMMON_DEPEND block above.
# All dependencies below this point should remain identical to those in
# the source ebuilds.

COMMON_DEPEND="
	${BIN_COMMON_DEPEND}
	${PYTHON_DEPS}
	app-arch/unzip
	app-arch/zip
	app-crypt/gpgme[cxx]
	app-text/hunspell:=
	>=app-text/libabw-0.1.0
	>=app-text/libebook-0.1
	app-text/libepubgen
	>=app-text/libetonyek-0.1
	app-text/libexttextcat
	app-text/liblangtag
	>=app-text/libmspub-0.1.0
	>=app-text/libmwaw-0.3.21
	>=app-text/libnumbertext-1.0.6
	>=app-text/libodfgen-0.1.0
	app-text/libqxp
	app-text/libstaroffice
	app-text/libwpd:0.10[tools]
	app-text/libwpg:0.3
	>=app-text/libwps-0.4
	app-text/mythes
	dev-cpp/abseil-cpp:=
	>=dev-cpp/clucene-2.3.3.4-r2
	>=dev-cpp/libcmis-0.5.2-r2
	dev-db/unixODBC
	>=games-engines/box2d-2.4.1:0
	dev-lang/perl
	dev-libs/boost:=[nls]
	dev-libs/expat
	dev-libs/hyphen
	dev-libs/icu:=
	dev-libs/libassuan
	dev-libs/libgpg-error
	>=dev-libs/liborcus-0.17.2:0/0.17
	dev-libs/librevenge
	dev-libs/libxml2
	dev-libs/libxslt
	dev-libs/nspr
	dev-libs/nss
	>=dev-libs/redland-1.0.16
	>=dev-libs/xmlsec-1.2.35[nss]
	media-gfx/fontforge
	media-gfx/graphite2
	media-libs/fontconfig
	>=media-libs/freetype-2.11.0-r1:2
	>=media-libs/harfbuzz-5.1.0:=[graphite,icu]
	media-libs/lcms:2
	>=media-libs/libcdr-0.1.0
	>=media-libs/libepoxy-1.3.1[X]
	>=media-libs/libfreehand-0.1.0
	media-libs/libjpeg-turbo:=
	media-libs/libpagemaker
	>=media-libs/libpng-1.4:0=
	>=media-libs/libvisio-0.1.0
	media-libs/libwebp:=
	media-libs/libzmf
	media-libs/openjpeg:=
	media-libs/tiff:=
	media-libs/zxing-cpp:=
	net-misc/curl
	sci-mathematics/lpsolve
	sys-libs/zlib
	virtual/glu
	virtual/opengl
	x11-libs/cairo[X]
	x11-libs/libXinerama
	x11-libs/libXrandr
	x11-libs/libXrender
	net-print/cups
	sys-apps/dbus
	gnome? (
		dev-libs/glib:2
		gnome-base/dconf
		gnome-extra/evolution-data-server
	)
	media-libs/gstreamer:1.0
	media-libs/gst-plugins-base:1.0
	!kde? (
		app-accessibility/at-spi2-core:2
		dev-libs/glib:2
		dev-libs/gobject-introspection
		gnome-base/dconf
		media-libs/mesa[egl(+)]
		x11-libs/gtk+:3[X]
		x11-libs/pango
	)
	kde? (
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5
		dev-qt/qtx11extras:5
		kde-frameworks/kconfig:5
		kde-frameworks/kcoreaddons:5
		kde-frameworks/ki18n:5
		kde-frameworks/kio:5
		kde-frameworks/kwindowsystem:5
	)
	dev-db/mariadb-connector-c
"

RDEPEND="${COMMON_DEPEND}
	acct-group/libreoffice
	acct-user/libreoffice
	!app-office/libreoffice
	!app-office/openoffice
	media-fonts/liberation-fonts
	|| ( x11-misc/xdg-utils kde-plasma/kde-cli-tools )
	java? ( virtual/jre:11 )
	kde? ( kde-frameworks/breeze-icons:* )
"

PDEPEND="
	=app-office/libreoffice-l10n-$(ver_cut 1-4)*
"

DEPEND="dev-util/xdelta:3"

# only one flavor at a time
REQUIRED_USE="kde? ( !gnome ) gnome? ( !kde ) ${PYTHON_REQUIRED_USE}"

RESTRICT="test strip"

S="${WORKDIR}"

PYTHON_UPDATER_IGNORE="1"

QA_PREBUILT="/usr/*"

pkg_setup() {
	python-single-r1_pkg_setup
}

src_unpack() {
	einfo "Uncompressing distfile ${ARCH}-${BASE_PACKAGENAME}-libreoffice-${PVR}.tar.xz"
	xz -cd "${DISTDIR}/${ARCH}-${BASE_PACKAGENAME}-libreoffice-${PVR}.tar.xz" > "${WORKDIR}/${ARCH}-${BASE_PACKAGENAME}-libreoffice-${PVR}.tar" || die

	local patchname
	use kde && patchname="-kde"
	use gnome && patchname="-gnome"
	use java && patchname="${patchname}-java"

	if [[ -n "${patchname}" ]]; then
		einfo "Patching distfile ${ARCH}-${BASE_PACKAGENAME}-libreoffice-${PVR}.tar using ${ARCH}-${BASE_PACKAGENAME}-libreoffice${patchname}-${PVR}.xd3"
		xdelta3 -d -s "${WORKDIR}/${ARCH}-${BASE_PACKAGENAME}-libreoffice-${PVR}.tar" "${DISTDIR}/${ARCH}-${BASE_PACKAGENAME}-libreoffice${patchname}-${PVR}.xd3" "${WORKDIR}/tmpdist.tar" || die
		mv "${WORKDIR}/tmpdist.tar" "${WORKDIR}/${ARCH}-${BASE_PACKAGENAME}-libreoffice-${PVR}.tar" || die
	fi

	einfo "Unpacking new ${ARCH}-${BASE_PACKAGENAME}-libreoffice-${PVR}.tar"
	unpack "./${ARCH}-${BASE_PACKAGENAME}-libreoffice-${PVR}.tar"
}

src_prepare() {
	cp "${FILESDIR}"/50-${PN} "${T}"
	eprefixify "${T}"/50-${PN}
	default
}

src_configure() { :; }

src_compile() { :; }

src_install() {
	dodir /usr
	cp -aR "${S}"/usr/* "${ED}"/usr/

	# prevent revdep-rebuild from attempting to rebuild all the time
	insinto /etc/revdep-rebuild && doins "${T}/50-${PN}"
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update

	ewarn 'If you plan to use the Base application you should use a source build and enable java and firebird.'
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
