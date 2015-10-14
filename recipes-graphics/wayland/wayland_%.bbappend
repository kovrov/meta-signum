BBCLASSEXTEND_append = " nativesdk"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "\
 file://always-build-scanner.patch \
"

EXTRA_OECONF_remove_class-native = "--enable-scanner"

EXTRA_OECONF_remove = "--disable-scanner"
EXTRA_OECONF_append = " --with-host-scanner"

FILES_${PN} = "${libdir}/*${SOLIBS}"
FILES_${PN}-dev += "${bindir} ${datadir}/wayland"
