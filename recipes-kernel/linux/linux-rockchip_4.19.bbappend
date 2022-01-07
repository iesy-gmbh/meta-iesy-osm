FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}_${LINUX_VERSION}:"

SRC_URI += " \
	file://0006-arm64-dts-rockchip-px30-use-uart2_m1-for-debug-console.patch \
	file://0007-arm64-configs-rockchip-px30-add-support-for-Microchip-VSC8541.patch \
	file://0008-arm64-dts-rockchip-px30-enable-spi1-and-add-spidev-device.patch \
	file://0009-arm64-configs-rockchip-px30-add-missing-px30-cpu-selection.patch \
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
