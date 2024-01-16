FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}_${LINUX_VERSION}:"

SRCREV = "6880fe608dcb8cf2bd32afea4019fa02b031f241"
SRC_URI = " \
        git://git.theobroma-systems.com/ringneck-linux.git;protocol=https;nobranch=1;branch=v6.0.2-ringneck; \
"

SRC_URI += " \
	file://config.cfg \
	file://0009-arm64-dts-iesy-add-iesy-rpx30-eva-mi.patch \
	file://0010-arm64-dts-iesy-limit-ethernet-phy-to-100-mbit.patch \
	file://0011-drivers-net-phy-mscc-implement-documented-bb138-ethernet-led-behavior.patch \
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
	file://0027-drivers-rtc-adopt-max31343-driver-to-new-kernel-api.patch \
	file://0028-scripts-add-tools-missing-in-6.0-source-tree.patch \
	file://0029-arch-arm64-add-support-for-iesy-rpx30.patch \
	file://0030-drivers-gpu-prepare-debugging-of-lt8912-bridge-opera.patch \

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
