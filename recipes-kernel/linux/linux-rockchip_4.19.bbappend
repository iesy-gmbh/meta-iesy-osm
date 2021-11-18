FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}_${LINUX_VERSION}:"

SRC_URI += " \
	file://0006-arm64-dts-rockchip-px30-use-UART5-for-debug-console.patch \
	file://0007-arm64-configs-rockchip-px30-add-support-for-Microchip-VSC8541.patch \
"
