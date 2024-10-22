FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot-imx:"

SRC_URI += " \
    file://0001-arch-arm-Add-support-for-iesy-imx8mm-eva-mi.patch \
    file://0002-arch-arm-Add-support-for-iesy-imx93-eva-mi.patch \
    file://0003-Include-configs-modify-boot-command.patch \
    file://0004-arch-arm-dts-moved-pmic-from-i2c2-to-i2c1-and-config.patch \
    file://0005-board-iesy-iesy_imx93_eva-adjust-lpddr4_timing.c.patch \
"

do_patch(){
    cd ${S}
    git am ${WORKDIR}/*.patch
}