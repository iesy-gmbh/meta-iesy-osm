FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot-rockchip:"

SRC_URI += " \
	file://0007-ram-rockchip-px30-add-config-based-LPDDR3-selection.patch \
	file://0008-arm64-dts-rockchip-px30-adapt-pmic-config-for-iesy-rpx30-eva-mi.patch \
	file://0009-arm64-dts-rockchip-px30-change-uart2-pinctrl.patch \
	file://0010-arm64-dts-rockchip-px30-adopt-iesy-rpx30-eva-mi-changes-from-linux-kernel.patch \
	file://0011-arm64-dts-rockchip-px30-change-pmic-reset-behavior.patch \
	file://0012-drm-rockchip-change-default-video-resolution-to-1280x720.patch \
	file://0013-rk809-change-pmic-reset-behaviour.patch \
	file://0014-arm64-dts-rockchip-px30-set-drive-strength-for-i2c0-to-8mA.patch \
	file://0015-arm64-dts-iesy-px30-add-missing-node-for-Microchip-VSC8541.patch \
	file://defconfig.cfg \
	file://ddrbin_param.txt \
	file://0016-arm64-dts-iesy-px30-fix-phy-node.patch \
	file://0017-arm64-dts-rockchip-px30-remove-adc-keys-backlight-battery-charger.patch \
"

DDR_BIN_FILE = "px30_ddr_333MHz_v*.bin"

do_configure:append() {
	# use parameters from given ddrbin_param.txt
	${WORKDIR}/rkbin/tools/ddrbin_tool ${WORKDIR}/ddrbin_param.txt ${WORKDIR}/rkbin/bin/rk33/${DDR_BIN_FILE}
}
