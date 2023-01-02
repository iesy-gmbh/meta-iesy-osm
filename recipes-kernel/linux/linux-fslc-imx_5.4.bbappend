FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}_${LINUX_VERSION}:"

SRC_URI += " \
    file://fragment.cfg \
    file://0001-arm64-dts-iesy-imx8mm-add-iesy-imx8mm-eva-mi.dts.patch \
    file://0002-arm64-dts-iesy-imx8mm-change-pmci-to-pca9450a-rem-un.patch \
    file://0003-arm64-dts-iesy-imx8mm-add-the-bb-leds.patch \
    file://0004-arm64-dts-iesy-imx8mm-change-pinconfig-console-funct.patch \
    file://0005-arm64-dts-iesy-imx8mm-add-sd-detect-remove-unused-no.patch \
"


unset KBUILD_DEFCONFIG
