FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}_${LINUX_VERSION}:"

SRC_URI += " \
	file://config.cfg \
	file://0006-arm64-configs-rockchip-px30-add-missing-px30-cpu-selection.patch \
	file://0007-scripts-mkimg-consider-dtbs-apart-from-Rockchip.patch \
	file://0008-arm64-Makefile-consider-dtbs-apart-from-Rockchip.patch \
	file://0009-arm64-dts-iesy-add-iesy-rpx30-eva-mi.patch \
	file://0010-arm64-dts-iesy-px30-use-uart2_m1-for-debug-console.patch \
	file://0011-arm64-dts-iesy-px30-enable-spi1-and-add-spidev-device.patch \
	file://0012-arm64-dts-iesy-px30-set-baudrate-to-115200.patch \
	file://0013-arm64-dts-iesy-adapt-pmic-config.patch \
	file://0014-arm64-dts-iesy-remove-rk809-audio-codec.patch \
	file://0015-arm64-dts-adapt-pmic-config-and-disable-devices-not-used.patch \
"

# do_kernel_metadata is executed before do_patch:
# https://git.yoctoproject.org/poky/commit/?id=ad6313d01b8877d426bf69179cd8ced61565a532
# Therefore patches to KBUILD_DEFCONFIG will not end up in ${B}/.config.
# 
# Make sure that the patched in-tree defconfig will be considered
do_apply_defconfig_patches(){
	set +e
	cd ${S}
	meta_dir=$(kgit --meta)

	if [ -n "${KBUILD_DEFCONFIG}" ]; then
		if [ -f "${WORKDIR}/defconfig" ]; then
			cmp "${WORKDIR}/defconfig" "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}"
			if [ $? -ne 0 ]; then
				cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
				cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${S}/${meta_dir}/configs/defconfig
			fi
		fi
	fi
}

addtask apply_defconfig_patches after do_patch before do_kernel_configme

python () {
    # Avoid replacing "rockchip/" as stated in linux-rockchip.inc. We need to be able to select
    # between Rockchip and iesy dtb in Makefiles
    d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', ' ' + d.getVar('KERNEL_DEVICETREE').replace('.dtb', '.img'));
}

# Add .cfg to Kernelconfig
do_configure_append() {
    ${S}/scripts/kconfig/merge_config.sh -m -O ${B} ${B}/.config ${WORKDIR}/*.cfg
}
