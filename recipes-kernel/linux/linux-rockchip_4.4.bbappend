FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}_${LINUX_VERSION}:"

SRC_URI += " \
	file://0001-arm64-dts-rockchip-px30-use-UART5-for-debug-console.patch \
"
