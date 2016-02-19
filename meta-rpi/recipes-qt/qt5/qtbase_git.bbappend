RDEPENDS_${PN} += "xkeyboard-config"

OE_QMAKE_PLATFORM = "linux-rasp-pi2-g++"

PACKAGECONFIG_GL = ""
PACKAGECONFIG_X11 = ""

PACKAGECONFIG_append = "\
 accessibility \
 dbus \
 evdev \
 examples \
 gles2 \
 libs \
 linuxfb \
 sql-sqlite \
 teststools \
 tools \
 widgets \
 xkb \
"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# EGL and GLES2
SRC_URI_append = "\
 file://0001-fix-rasp-build.patch \
"

EXTRA_OECONF_append = "\
 '-I${STAGING_DIR_TARGET}/usr/include/interface/vcos/pthreads/' \
 '-I${STAGING_DIR_TARGET}/usr/include/interface/vmcs_host/linux/' \
"
