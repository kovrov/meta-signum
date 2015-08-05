# qt-waveshare-7inch-hdmi-lcd-b

SUMMARY = "User-space driver for Waveshare touch screen"

DESCRIPTION = "Qt plugin to work with Waveshare 7-inch capacitive touch screen \
http://www.waveshare.com/7inch-HDMI-LCD-B.htm"

HOMEPAGE = "https://github.com/kovrov/hidrawtouch"

LICENSE = "LGPLv2"
LIC_FILES_CHKSUM = "file://LICENSE;md5=40d2542b8c43a3ec2b7f5da31a697b88"

DEPENDS += "qtbase udev"

inherit qmake5

SRC_URI = "git://github.com/kovrov/hidrawtouch.git;protocol=https"
SRCREV = "774fa39c6f4b63243e20b056c0f8d303139bce70"

PV = "0.1+git${SRCPV}"
S = "${WORKDIR}/git/"

FILES_${PN} += "${OE_QMAKE_PATH_PLUGINS}/generic/"
FILES_${PN}-dbg += "${OE_QMAKE_PATH_PLUGINS}/generic/.debug/"
FILES_${PN}-dev += "${OE_QMAKE_PATH_LIBS}/cmake/*"
