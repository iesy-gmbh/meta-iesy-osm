# Copyright (C) 2023 iesy GmbH

FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot-mainline:"

require recipes-bsp/u-boot/u-boot-common.inc
require recipes-bsp/u-boot/u-boot.inc

PROVIDES = "virtual/bootloader"

LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"

SRCREV = "4459ed60cb1e0562bc5b40405e2b4b9bbf766d57"
# SRCREV = "${AUTOREV}"

DEPENDS += "rockchip-atf bc-native dtc-native python3-pyelftools-native"

SRC_URI += " \
        file://0001-rockchip-px30-add-support-for-iesy-rpx30-eva-mi.patch \
    "

do_patch() {
	cd ${S}
	git am ${WORKDIR}/*.patch
}

do_compile:prepend () {
    export BL31=${DEPLOY_DIR_IMAGE}/bl31.elf
}

do_deploy:append () {
    install -Dm 0644 ${B}/u-boot-rockchip.bin ${DEPLOYDIR}/u-boot-rockchip.bin
}