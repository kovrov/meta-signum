LINUX_VERSION ?= "4.1.10"

SRCREV = "499958c660a8558ddb72d3f0c3ac51a8e9b63fc2"
SRC_URI = "git://github.com/raspberrypi/linux.git;protocol=git;branch=rpi-4.1.y"

require linux-raspberrypi.inc
