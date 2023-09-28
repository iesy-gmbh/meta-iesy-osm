FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}_${LINUX_VERSION}:"

SRC_URI += " \
    file://defconfig \
    file://fragment.cfg \
    file://0001-arm64-dts-iesy-Add-support-for-iesy-imx8mm.patch \
    file://0002-arm64-dts-iesy-iesy-imx8mm-eva-mi-Rev2-hardware-cha.patch \
"


unset KBUILD_DEFCONFIG
