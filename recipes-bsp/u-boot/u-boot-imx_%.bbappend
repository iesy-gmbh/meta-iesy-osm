FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot-imx:"

SRC_URI += " \
    file://0001-arch-arm-Add-support-for-iesy-imx8mm-eva-mi.patch \
    file://0002-arch-arm-Add-support-for-iesy-imx93-eva-mi.patch \
"

do_patch(){
    cd ${S}
    git am ${WORKDIR}/*.patch
}