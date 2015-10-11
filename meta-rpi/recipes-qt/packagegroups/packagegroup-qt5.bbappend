PACKAGES += "\
 packagegroup-qt5-machine-related \
"

RDEPENDS_packagegroup-qt5-machine-related = "\
 ${@base_contains('MACHINE', 'raspberrypi', 'userland', '', d)} \
 ${@base_contains('MACHINE', 'raspberrypi2', 'userland', '', d)} \
"
