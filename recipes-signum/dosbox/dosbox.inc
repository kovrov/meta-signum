DESCRIPTION = "Dos Emulator based on SDL"
SECTION = "base"
PRIORITY = "optional"
DEPENDS = "virtual/libsdl2 libpng zlib"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"

SRC_URI = "git://bitbucket.org/sergk/dosbox.git;protocol=https;branch=sdl2"

PV = "git${SRCPV}"
S = "${WORKDIR}/git/"

inherit autotools
