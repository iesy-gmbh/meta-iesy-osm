FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot-fslc:"

SRC_URI += " \
    file://0001-arch-arm-dts-imx8mm-evk-change-uart-console.patch \
    file://0002-arch-arm-dts-imx8mm-evk-change-PMIC.patch \
    file://0003-include-configs-imx8mm-evk-change-RAM-size.patch \
"
