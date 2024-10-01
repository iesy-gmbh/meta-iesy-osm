FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot-ti-staging:"

SRC_URI += " \
    file://0001-arm-dts-add-ddr-timing.patch \
    file://0002-board-ti-am62x-use-iesy-device-tree.patch \
    file://0003-board-ti-am62x-set-rootfs-device-from-boot-device.patch \
"

# file://0001-arm-dts-add-support-for-iesy-am62xx-eva-mi.patch

do_patch(){
    cd ${S}
    git am ${WORKDIR}/*.patch
}