FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}_${LINUX_VERSION}:"

SRC_URI += " \
    file://fragment.cfg \
    file://0001-arm64-dts-iesy-Add-support-for-iesy-imx8mm.patch \
    file://0004-arm64-dts-iesy-iesy-imx8mm-eva-mi-config-usdhc1-for-.patch \
"


unset KBUILD_DEFCONFIG
