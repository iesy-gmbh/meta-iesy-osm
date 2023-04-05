FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}_${LINUX_VERSION}:"

SRC_URI += " \
    file://fragment.cfg \
    file://0001-arm64-dts-iesy-add-iesy-imx8mm-eva-mi.dts.patch \
"


unset KBUILD_DEFCONFIG
