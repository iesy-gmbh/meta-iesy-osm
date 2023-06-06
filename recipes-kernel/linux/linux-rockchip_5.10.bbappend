FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}_${LINUX_VERSION}:"

SRCREV = "a4423c56f430bfc7c75dbb68d4a9a1a0ef62b371"
SRC_URI = " \
        git://github.com/rockchip-linux/kernel.git;protocol=https;nobranch=1;branch=develop-5.10; \
"

SRC_URI += " \
	file://config.cfg \
	file://0007-scripts-mkimg-consider-dtbs-apart-from-Rockchip.patch \
	file://0008-arm64-makefile-consider-dtbs-apart-from-rockchip.patch \
	file://0009-arm64-dts-iesy-add-iesy-rpx30-eva-mi.patch \
	file://0010-arm64-dts-iesy-limit-ethernet-phy-to-100-mbit.patch \
	file://0011-drivers-net-phy-mscc-implement-documented-bb138-ethernet-led-behavior.patch \
	file://0012-drivers-gpu-drm-bridge-add-support-for-lt8912-dsi-to-hdmi-bridge.patch \
"

python () {
    # Avoid replacing "rockchip/" as stated in linux-rockchip.inc. We need to be able to select
    # between Rockchip and iesy dtb in Makefiles
    d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', ' ' + d.getVar('KERNEL_DEVICETREE').replace('.dtb', '.img'));
}

# Add .cfg to Kernelconfig
do_configure:append() {
    ${S}/scripts/kconfig/merge_config.sh -m -O ${B} ${B}/.config ${WORKDIR}/*.cfg
}
