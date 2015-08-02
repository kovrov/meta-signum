DESCRIPTION = "Packagegroup for qt5 image."

LICENSE = "MIT"

inherit packagegroup

PACKAGES += "\
    packagegroup-qt5-base \
    packagegroup-qt5-extra \
    packagegroup-qt5-fonts \
    packagegroup-qt5-graphics \
    packagegroup-qt5-web \
    "

RDEPENDS_packagegroup-qt5-base = "\
    qtbase \
    qtbase-plugins \
    qtbase-tools \
    "

RDEPENDS_packagegroup-qt5-fonts = "\
    qtbase-fonts \
    qtbase-fonts-pfa \
    qtbase-fonts-pfb \
    qtbase-fonts-qpf \
    qtbase-fonts-ttf-dejavu \
    qtbase-fonts-ttf-vera \
    "

RDEPENDS_packagegroup-qt5-graphics ="\
    qt3d \
    qt3d-qmlplugins \
    qt3d-tools \
    qtdeclarative \
    qtdeclarative-plugins \
    qtdeclarative-qmlplugins \
    qtdeclarative-tools \
    qtgraphicaleffects-qmlplugins \
    qtimageformats-plugins \
    qtmultimedia \
    qtmultimedia-plugins \
    qtmultimedia-qmlplugins \
    qtsvg \
    qtsvg-plugins \
    "

RDEPENDS_packagegroup-qt5-web ="\
    "

RDEPENDS_packagegroup-qt5-extra ="\
    qtconnectivity \
    qtconnectivity-qmlplugins \
    qtenginio \
    qtenginio-qmlplugins \
    qtlocation \
    qtlocation-plugins \
    qtlocation-qmlplugins \
    qtquickcontrols-qmlplugins \
    qtscript \
    qtsensors \
    qtsensors-plugins \
    qtsensors-qmlplugins \
    qtserialport \
    qtsystems \
    qtsystems-qmlplugins \
    qtsystems-tools \
    qttools \
    qttools-plugins \
    qttools-tools \
    qtwebsockets \
    qtwebsockets-qmlplugins \
    qtxmlpatterns \
    qtxmlpatterns-tools \
    "
