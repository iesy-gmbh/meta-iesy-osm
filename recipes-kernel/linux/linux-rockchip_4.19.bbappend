FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}_${LINUX_VERSION}:"

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
	file://0016-arm64-dts-iesy-adapt-gmac-config.patch \
	file://0017-arm64-dts-iesy-disable-emmc-high-speed-mode.patch \
	file://0018-arm64-dts-iesy-reenable-moderate-emmc-sdr-high-speed-mode.patch \
	file://0019-arm64-dts-iesy-reenable-emmc-hs200-mode-after-hw-fix.patch \
	file://0020-arm64-dts-iesy-add-entry-for-lm75-sensor-on-i2c0-at-0x4e.patch \
	file://0021-arm64-dts-iesy-add-entries-for-at24-eeproms-on-i2c0.patch \
	file://0022-arm64-dts-iesy-add-entries-for-uart0-and-uart1.patch \
	file://0023-arm64-dts-iesy-add-entries-for-pwm2-and-pwm3.patch \
	file://0024-arm64-dts-iesy-correct-voltage-regulators-used-in-io-domains.patch \
	file://0025-arm64-dts-iesy-assign-regulators-to-usb-ports.patch \
	file://0026-arm64-dts-iesy-add-definitions-for-user-leds.patch \
	file://0027-drivers-gpu-drm-bridge-add-missing-support-for-Lontium-LT8912.patch \
	file://0028-arm64-dts-iesy-use-gpio3_b0-as-chip-select-for-spi1.patch \
	file://0029-arm64-dts-iesy-add-support-for-imx219-and-raspi-camera.patch \
	file://0030-arm64-dts-iesy-remove-all-devices-not-available-on-cm006-and-bb138.patch \
	file://0031-arm64-dts-iesy-show-heartbeat-on-ld4.patch \
	file://0032-drivers-gpu-drm-lt8912-i2c-only-driver-plus-simple-panel.patch \
	file://0033-arm64-dts-iesy-add-definitions-for-user-buttons.patch \
	file://0034-arm64-dts-iesy-set-default-display-resolution-1920x1080.patch \
	file://0036-drivers-gpu-drm-separate-lt8912-drivers-for-bridge-and-i2c-mode.patch \
	file://0037-arm64-dts-iesy-set-micro-usb-port-to-peripheral-mode.patch \
	file://0038-arm64-dts-iesy-px30-set-drive-strength-for-i2c0-to-8mA.patch \
	file://0039-arm64-dts-iesy-px30-add-missing-node-for-Microchip-VSC8541.patch \
	file://0040-drivers-drm-bridge-lt8912-make-sure-to-use-device-tree-for-setting-MIPI-PN-lines-swap.patch \
	file://0041-arm64-dts-iesy-px30-add-comment-to-swap-mipi-pn-property.patch \
	file://0042-arm64-dts-iesy-px30-swap-gpios-for-lt8912-hpd-and-reset.patch \
	file://0043-arm64-dts-iesy-Config-Eth-LED.patch \
	file://0044-arm64-dts-iesy-set-drive-strength.patch \
	file://0045-arm64-dts-iesy-disable-unused-regulators.patch \
	file://0046-arm64-dts-iesy-px30-set-RAM-odt-freq-odt-res.patch \
	file://0047-arm64-dts-iesy-px30-revert-RAM-config-disable-auto-f.patch \
	file://0048-arm64-dts-iesy-fix-wrong-PHY-address.patch \
	file://0049-arm64-dts-iesy-px30-limit-sdmmc-speed.patch \
	file://0050-arm64-dts-iesy-px30-set-SD-max-freq-to-135MHz.patch \
	file://0051-arm64-dts-iesy-px30-fix-serial-pin-config.patch \
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
