FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}_${LINUX_VERSION}:"

SRCREV = "a4423c56f430bfc7c75dbb68d4a9a1a0ef62b371"
SRC_URI = " \
        git://github.com/rockchip-linux/kernel.git;protocol=https;nobranch=1;branch=develop-5.10; \
"

SRC_URI += " \
	file://config.cfg \
	file://0006-arm64-configs-rockchip-px30-add-missing-px30-cpu-selection.patch \
	file://0007-scripts-mkimg-consider-dtbs-apart-from-Rockchip.patch \
	file://0008-arm64-makefile-consider-dtbs-apart-from-rockchip.patch \
	file://0009-arm64-dts-iesy-add-iesy-rpx30-eva-mi.patch \
	file://0010-arm64-dts-iesy-limit-ethernet-phy-to-100-mbit.patch \
	file://0011-drivers-net-phy-mscc-implement-documented-bb138-ethernet-led-behavior.patch \
	file://0012-drivers-gpu-drm-bridge-add-support-for-lt8912-dsi-to-hdmi-bridge.patch \
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
				cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${S}/${meta_dir}/cfg/defconfig
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
do_configure:append() {
    ${S}/scripts/kconfig/merge_config.sh -m -O ${B} ${B}/.config ${WORKDIR}/*.cfg
}
