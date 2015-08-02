PACKAGES += "\
    packagegroup-qt5-machine-related \
    "

RDEPENDS_packagegroup-qt5-machine-related = "\
    ${@base_contains('MACHINE', 'raspberrypi', 'vc-graphics-hardfp', '', d)} \
    ${@base_contains('MACHINE', 'raspberrypi2', 'vc-graphics-hardfp', '', d)} \
    "
