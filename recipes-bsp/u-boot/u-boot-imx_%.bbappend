FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot-imx:"

SRC_URI += " \
    file://defconfig.cfg \
    file://0001-arch-arm-dts-change-model-name.patch \
    file://0002-arch-arm-dts-config-DRAM.patch \
    file://0003-arm64-imx8mm-dts-change-pin-conf-for-sd-detection.patch \
    file://0005-include-configs-imx8mm_evk-change-kernel-console.patch \
    file://0006-arch-arm-dts-config-PMIC-voltages.patch \
    file://0007-arch-arm-dts-config-uboot-console-uart3.patch \
"