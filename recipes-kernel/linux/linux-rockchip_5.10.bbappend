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
	file://0022-drivers-rtc-add-support-for-max31343-rtc.patch \
	file://0023-arm64-dts-rockchip-separate-device-tree-files-for-cm006-and-bb138a.patch \
	file://0024-arm64-dts-rockchip-add-digital-mic-on-MAX9867.patch \
	file://0025-drivers-dsi-implement-workaround-for-rockchip-dsi-bug.patch \
	file://0026-arm64-dts-rockchip-enable-drm.patch \
	file://0027-arm64-dts-iesy-change-LT8912-reset-to-dummy.patch \
	file://0028-arm64-dts-iesy-assign-clock-rate-for-audio-codec.patch \
	file://0029-arm64-dts-iesy-iesy-rpx30-osm-sf-disable-unused-regu.patch \
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
