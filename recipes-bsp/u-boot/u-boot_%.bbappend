FILESEXTRAPATHS_prepend := "${THISDIR}/u-boot:"

SRC_URI += " \
	file://0007-ram-rockchip-px30-add-config-based-LPDDR3-selection.patch \
	file://defconfig.cfg \
	file://ddrbin_param.txt \
"

DDR_BIN_FILE = "px30_ddr_333MHz_v1.15.bin"

do_configure_append() {
	# use UART5 for debug
	${WORKDIR}/rkbin/tools/ddrbin_tool ${WORKDIR}/ddrbin_param.txt ${WORKDIR}/rkbin/bin/rk33/${DDR_BIN_FILE}
}
