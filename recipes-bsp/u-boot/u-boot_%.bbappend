FILESEXTRAPATHS_prepend := "${THISDIR}/u-boot:"

SRC_URI += " \
	file://0007-ram-rockchip-px30-add-config-based-LPDDR3-selection.patch \
	file://0008-arm64-dts-rockchip-px30-adapt-pmic-config-for-iesy-rpx30-eva-mi.patch \
	file://0009-arm64-dts-rockchip-px30-change-uart2-pinctrl.patch \
	file://defconfig.cfg \
	file://ddrbin_param.txt \
"

DDR_BIN_FILE = "px30_ddr_333MHz_v1.15.bin"

do_configure_append() {
	# use parameters from given ddrbin_param.txt
	${WORKDIR}/rkbin/tools/ddrbin_tool ${WORKDIR}/ddrbin_param.txt ${WORKDIR}/rkbin/bin/rk33/${DDR_BIN_FILE}
}
