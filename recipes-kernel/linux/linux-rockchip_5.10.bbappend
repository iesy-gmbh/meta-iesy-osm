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
	file://0013-arm64-dts-iesy-add-iesy-rpx30-eva-mi-v2.dts.patch \
	file://0014-arm64-dts-iesy-adapt-to-bb138-v2-gpio-and-pwm-changes.patch \
	file://0015-arm64-dts-iesy-change-BB138-V2-eeprom-address.patch \
	file://0016-arm64-dts-iesy-add-rtc-PCF85263-on-BB138-V2.patch \
	file://0017-arm64-dts-iesy-add-max9867-sound-codec.patch \
	file://0018-arm64-dts-iesy-add-spi-bus-for-acceleration-sensor.patch \
	file://0019-arm64-dts-iesy-enable-internal-pullups-on-cs-clk-and-mosi-of-spi-bus-0.patch \
	file://0020-arm64-dts-iesy-enable-i2s-master-clock-and-reduce-i2s-channels.patch \
	file://0021-arm64-dts-rockchip-add-uio-support-for-header-gpios.patch \
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
