FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot-imx:"

SRC_URI += " \
    file://0001-arch-arm-Add-support-for-iesy-imx8mm-eva-mi.patch \
    file://0002-include-configs-iesy-imx8mm-eva-mi-disable-critical-.patch \
    file://0003-arm-dts-iesy-imx8mm-eva-mi-move-ddrc-usdhc3-to-modul.patch \
    file://0004-configs-iesy_imx8mm_eva_mi-set-HW-revision-for-i.MX8.patch \
"