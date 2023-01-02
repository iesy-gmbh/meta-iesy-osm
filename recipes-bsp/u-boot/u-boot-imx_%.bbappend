FILESEXTRAPATHS_prepend := "${THISDIR}/u-boot-imx:"

SRC_URI += " \
    file://defconfig.cfg \
    file://0001-arm64-imx8mm-change-console-uart2-3-config-new-pmic.patch \
    file://0002-arm64-imx8mm-config-PMIC.patch \
    file://0003-arm64-imx8mm-dts-change-pin-conf-for-sd-detection.patch \
    file://0004-arm64-imx8mm-change-boot-cmd.patch \
    file://0005-arm64-imx8mm-add-mem-parameter-to-boot-cmd.patch \
"
