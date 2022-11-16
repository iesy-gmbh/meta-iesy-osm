FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}_${LINUX_VERSION}:"

SRC_URI += " \
    file://0001-arm64-dts-iesy-imx8mm-add-iesy-imx8mm-eva-mi.dts.patch \
"

unset KBUILD_DEFCONFIG
