SRCFORK = "kovrov"
SRCBRANCH = "wayland"
SRCREV = "ec3079a3232b5e6e5f68dfa196571bf094e82646"

EXTRA_OECMAKE += "-DBUILD_WAYLAND=on"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = "\
 file://egl.pc \
 file://vchiq.sh \
"
# file://wayland-egl.pc

do_install_append() {
    install -d ${D}${libdir}/pkgconfig
    install -m 0644 ${WORKDIR}/egl.pc ${D}${libdir}/pkgconfig/
    # install -m 0644 ${WORKDIR}/wayland-egl.pc ${D}${libdir}/pkgconfig/

    install -d ${D}/${sysconfdir}/init.d
    install -m 0755 ${WORKDIR}/vchiq.sh ${D}${sysconfdir}/init.d/

    mv ${D}${libdir}/libEGL.so.1.0.0 ${D}${libdir}/libEGL.so
    rm ${D}${libdir}/libEGL.so.1

    mv ${D}${libdir}/libGLESv2.so.2.0.0 ${D}${libdir}/libGLESv2.so
    rm ${D}${libdir}/libGLESv2.so.2
}

FILES_${PN} += "\
 ${libdir}/pkgconfig \
"
