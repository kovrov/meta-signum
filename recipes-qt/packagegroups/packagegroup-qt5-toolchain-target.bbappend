RDEPENDS_${PN} += "\
 libsdl2-dev \
 ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-dev', '', d)} \
"
