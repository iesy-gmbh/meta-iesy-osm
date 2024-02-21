FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot-ti-staging:"

SRC_URI += " \
    file://0001-arm-dts-add-support-for-iesy-am62xx-eva-mi.patch \
"

do_patch(){
    cd ${S}
    git am ${WORKDIR}/*.patch
}