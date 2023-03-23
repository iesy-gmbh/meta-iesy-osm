FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}_${LINUX_VERSION}:"

SRC_URI += " \
    file://fragment.cfg \
    file://0001-arm64-dts-iesy-imx8mm-add-iesy-imx8mm-eva-mi.dts.patch \
    file://0002-arm64-dts-iesy-imx8mm-change-pmci-to-pca9450a-rem-un.patch \
    file://0003-arm64-dts-iesy-imx8mm-add-the-bb-leds.patch \
    file://0004-arm64-dts-iesy-imx8mm-change-pinconfig-console-funct.patch \
    file://0005-arm64-dts-iesy-imx8mm-add-sd-detect-remove-unused-no.patch \
    file://0006-arm64-dts-iesy-imx8mm-adjust-voltage-levels.patch \
    file://0007-arm64-dts-iesy-imx8mm-support-up-to-sdr104.patch \
    file://0008-arm64-dts-iesy-imx8mm-add-i2c-devices.patch \
    file://0009-arm64-dts-iesy-imx8mm-config-uart-interfaces.patch \
    file://0010-arm64-dts-iesy-imx8mm-config-usb-interfaces.patch \
    file://0011-arm64-dts-iesy-imx8mm-config-buttons-pwm.patch \
    file://0012-arm64-dts-iesy-imx8mm-remove-sai5.patch \
    file://0013-arm64-dts-iesy-imx8mm-remove-unused-nodes.patch \
    file://0014-arm64-dts-iesy-imx8mm-add-ecspi1-spiB.patch \
"


unset KBUILD_DEFCONFIG
