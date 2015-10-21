SRCREV = "cc92dfd6c4e8e2d90c3903dccfe77f7274b8d1b7"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# file://vchiq.sh
SRC_URI_append = "\
 file://egl.pc \
 file://0001-fix-gcc-5.x-inlines.patch \
 file://0002-fix-musl-build.patch \
 file://0003-fix-alloc-size-uninitialized.patch \
"

do_install_append() {
    install -d ${D}${libdir}/pkgconfig
    install -m 0644 ${WORKDIR}/egl.pc ${D}${libdir}/pkgconfig/

    # install -d ${D}/${sysconfdir}/init.d
    # install -m 0755 ${WORKDIR}/vchiq.sh ${D}${sysconfdir}/init.d/
}

# INITSCRIPT_NAME = "vchiq.sh"
# INITSCRIPT_PARAMS = "start 03 S ."

FILES_${PN} += "\
 ${libdir}/pkgconfig \
"
