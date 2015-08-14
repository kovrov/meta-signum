# Yocto meta-layer for Signum


## Build Configuration

Clone Yocto and required layers:

    export BASE=~/projects/signum-pi
    mkdir -p $BASE && cd $BASE
    git clone -b fido git://git.yoctoproject.org/poky poky-fido
    cd poky-fido
    git clone -b fido git://git.yoctoproject.org/meta-raspberrypi
    git clone -b fido https://github.com/meta-qt5/meta-qt5.git
    git clone -b fido https://github.com/kovrov/meta-signum.git

Initialize build configuration "build-rpi":

    cd $BASE
    . poky-fido/oe-init-build-env build-rpi

Edit *$BASE/build-rpi/conf/bblayers.conf* so the `BBLAYERS` variable contains following paths:

    BBLAYERS ?= " \
      ${TOPDIR}/../poky-fido/meta-signum \
      ${TOPDIR}/../poky-fido/meta-signum/meta-rpi \
      ${TOPDIR}/../poky-fido/meta-raspberrypi \
      ${TOPDIR}/../poky-fido/meta-qt5 \
      ${TOPDIR}/../poky-fido/meta-openembedded/meta-networking \
      ${TOPDIR}/../poky-fido/meta-openembedded/meta-python \
      ${TOPDIR}/../poky-fido/meta-openembedded/meta-oe \
      ${TOPDIR}/../poky-fido/meta \
      ${TOPDIR}/../poky-fido/meta-yocto \
      "

Add or update BitBake variables in *$BASE/build-rpi/conf/local.conf*:

    MACHINE = "raspberrypi"
    GPU_MEM = "128"
    DISTRO_FEATURES_remove = "x11 wayland"
    PACKAGE_CLASSES = "package_ipk"

The `MACHINE` variable could be "raspberrypi" or "raspberrypi2". The `GPU_MEM` variable is used to configure Raspberry Pi GPU memory in megabytes. Optionally `DL_DIR` variable could be set to a common location so archives downloaded from upstream repositories could be shared between different build configurations.

### Optional packages

Packages *omxplayer* and *gstreamer1.0-libav* (defined in meta-raspberrypi) depends on *libav* which has a commercial license. In order to be able to  include them in the image, the variable `LICENSE_FLAGS_WHITELIST` must contain "commercial".


## Building

The image name is "qt5-image-signum"

    bitbake qt5-image-signum


## Deploying

Generated images located in *$BASE/build-rpi/tmp/deploy/images/raspberrypi/*. An image could be written to SD card partition with `dd` tool.

    sudo umount /dev/sdx*
    sudo dd if=$BASE/build-rpi/tmp/deploy/images/raspberrypi/qt5-image-signum-raspberrypi.rpi-sdimg of=/dev/sdx
    sync

Where "sdx" is the name of SD card device on "sysfs". The name could be queried with `df -h`.

Comprehensive information could be fond on Raspberry Pi Documentation site -- [Installing Operating System Images on Linux](https://www.raspberrypi.org/documentation/installation/installing-images/linux.md)

### Configuring

To configure TimeZone manually:

    ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
    /etc/init.d/ntpd stop
    ntpdate -s time.nist.gov
    /etc/init.d/ntpd start


## Qt5 Toolchain and SDK

The *meta-qt5* provides an installable Qt5 toolchain and SDK. The recipe name is "meta-toolchain-qt5". It could be built with a BitBake:

    bitbake meta-toolchain-qt5

The generated binary installer located in *$BASE/build-rpi/tmp/deploy/sdk/*. It is an interactive installation script:

    tmp/deploy/sdk/poky-glibc-x86_64-meta-toolchain-qt5-arm1176jzfshf-vfp-toolchain-1.8.sh -d <dir>

If omitted, the `<dir>` is "/opt/poky/1.8" which would require running installer with `sudo`.

To use the toolchain, following *environment-setup script* must be sourced every time:

    . /opt/poky/1.8/environment-setup-arm1176jzfshf-vfp-poky-linux-gnueabi

## Credits

This information is based on different sources I found all over the Internet, but mostly on very useful articles on http://embarcados.com.br/ and meta-layer code on https://bitbucket.org/embarcados
