SUMMARY = "Qt Network declarative plugin"

DESCRIPTION = "Qt Network Bearer Management declarative bindings."

HOMEPAGE = "https://github.com/kovrov/quicknetwork"

LICENSE = "LGPLv2"
LIC_FILES_CHKSUM = "file://LICENSE;md5=40d2542b8c43a3ec2b7f5da31a697b88"

DEPENDS += "qtbase qtdeclarative"

inherit qmake5

SRC_URI = "git://github.com/kovrov/quicknetwork.git;protocol=https"

SRCREV = "56838762323e38863bf72d85146966ba868fca1d"

PV = "0.1+git${SRCPV}"
S = "${WORKDIR}/git/"

FILES_${PN} += "${OE_QMAKE_PATH_QML}/Network/"
FILES_${PN}-dbg += "${OE_QMAKE_PATH_QML}/Network/.debug/"
