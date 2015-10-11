SUMMARY = "Signum"

DESCRIPTION = "QML template app"

HOMEPAGE = "https://github.com/kovrov/signum"

LICENSE = "GPLv3"
LIC_FILES_CHKSUM = "file://LICENSE;md5=7702f203b58979ebbc31bfaeb44f219c"

DEPENDS += "qtbase"
RDEPENDS_${PN} = "qtdeclarative quicknetwork quickews bash"

SRC_URI = "\
    git://github.com/kovrov/signum.git;protocol=https \
    file://signum \
"

SRCREV = "2a62f60066b4cc03c8790efa2fa5d8557314cf5c"

PV = "0.1+git${SRCPV}"
S = "${WORKDIR}/git/"

inherit qmake5 update-rc.d

FILES_${PN} += "/usr/share/signum"

INITSCRIPT_NAME = "signum"
INITSCRIPT_PARAMS = "defaults"

do_install_append() {
    install -d ${D}${sysconfdir}/init.d
    install -m 0755 ${WORKDIR}/signum ${D}${sysconfdir}/init.d
}
