DEPENDS += "\
 libxkbcommon \
 virtual/egl \
 ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = "\
 ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'file://wayland-egl.patch', '', d)} \
"

EXTRA_OECONF += "\
 ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '--enable-video-wayland', '', d)} \
"
