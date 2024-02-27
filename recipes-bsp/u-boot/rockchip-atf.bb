# Copyright (C) 2023 iesy GmbH

SUMMARY = "Arm Trusted Firmware for Rockchip platforms"
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://docs/license.rst;md5=b2c740efedc159745b9b31f88ff03dde"

SRCREV = "a1be69e6c5db450f841f0edd9d734bf3cffb6621"
SRC_URI = "git://github.com/ARM-software/arm-trusted-firmware.git;protocol=https;nobranch=1"

S = "${WORKDIR}/git"

ATF_PLAT ?= "px30"

inherit deploy

PROVIDES = "virtual/arm-trusted-firmware"

EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
EXTRA_OEMAKE += 'STAGING_INCDIR=${STAGING_INCDIR_NATIVE} STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'

do_compile() {
    unset LDFLAGS
    unset CFLAGS
    unset CPPFLAGS
    oe_runmake PLAT=${ATF_PLAT}
}

do_install[noexec] = "1"

addtask deploy after do_compile
do_deploy() {
    install -Dm 0644 ${S}/build/px30/release/bl31/bl31.elf ${DEPLOYDIR}/bl31.elf
}

FILES:${PN} += " \
    /boot \
    /boot/bl31.elf \
    "
