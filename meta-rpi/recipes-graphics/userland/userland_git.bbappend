FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = "\
 file://egl.pc \
 file://0001-fix-gcc-5.x-inlines.patch \
 file://0003-fix-alloc-size-uninitialized.patch \
"

do_install_append() {
    install -d ${D}${libdir}/pkgconfig
    install -m 0644 ${WORKDIR}/egl.pc ${D}${libdir}/pkgconfig/
}

FILES_${PN} += "\
 ${libdir}/pkgconfig \
"
