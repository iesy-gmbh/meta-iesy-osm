FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot-imx:"

SRC_URI += " \
    file://0001-arch-arm-Add-support-for-iesy-imx8mm-eva-mi.patch \
    file://0002-arch-arm-Add-support-for-iesy-imx93-eva-mi.patch \
    file://0003-Include-configs-modify-boot-command.patch \
    file://0004-arch-arm-dts-moved-pmic-from-i2c2-to-i2c1-and-config.patch \
    file://0005-board-iesy-iesy_imx93_eva-adjust-lpddr4_timing.c.patch \
    file://0006-arm-dts-add-pullup-resistor-for-sd-card-writeprotect.patch \
    file://0007-board-iesy-iesy_imx8mm_eva_mi-add-missing-include.patch \
    file://0008-configs-iesy_imx8mm_eva_mi_v1_defconfig-disable-EFI-.patch \
    file://0009-board-iesy_imx93_eva_mi-add-missing-include-fix-RNG-.patch \
    file://0010-configs-iesy_imx93-disable-EFI-capsule-auth-enable-C.patch \
    file://0011-arm-dts-remove-type-c-nodes.patch \
"

do_patch(){
    cd ${S}
    git am ${WORKDIR}/*.patch
}