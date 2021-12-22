FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}_${LINUX_VERSION}:"

SRC_URI += " \
	file://0006-arm64-dts-rockchip-px30-use-UART5-for-debug-console.patch \
	file://0007-arm64-configs-rockchip-px30-add-support-for-Microchip-VSC8541.patch \
	file://0008-arm64-dts-rockchip-px30-enable-spi1-and-add-spidev-device.patch \
	file://0009-arm64-configs-rockchip-px30-add-missing-px30-cpu-selection.patch \
"
