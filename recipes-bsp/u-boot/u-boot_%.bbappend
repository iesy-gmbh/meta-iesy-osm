FILESEXTRAPATHS_prepend := "${THISDIR}/u-boot:"

SRC_URI += " \
	file://0007-ram-rockchip-px30-add-config-based-LPDDR3-selection.patch \
	file://0008-arm64-dts-rockchip-px30-adapt-pmic-config-for-iesy-rpx30-eva-mi.patch \
	file://0009-arm64-dts-rockchip-px30-change-uart2-pinctrl.patch \
	file://0010-arm64-dts-rockchip-px30-adopt-iesy-rpx30-eva-mi-changes-from-linux-kernel.patch \
	file://0011-arm64-dts-rockchip-px30-change-pmic-reset-behavior.patch \
	file://0012-drm-rockchip-change-default-video-resolution-to-1280x720.patch \
	file://defconfig.cfg \
	file://ddrbin_param.txt \
"

DDR_BIN_FILE = "px30_ddr_333MHz_v*.bin"

do_configure_append() {
	# use parameters from given ddrbin_param.txt
	${WORKDIR}/rkbin/tools/ddrbin_tool ${WORKDIR}/ddrbin_param.txt ${WORKDIR}/rkbin/bin/rk33/${DDR_BIN_FILE}
}
