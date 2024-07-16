FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI += " \
    file://fragment.cfg \
    file://0001-arm64-dts-iesy-Add-support-for-iesy-imx8mm.patch \
    file://0002-arm64-dts-iesy-iesy-imx8mm-eva-mi-Rev2-hardware.patch \
    file://0003-arm64-dts-iesy-iesy-imx8mm-eva-mi-add-LT8912.patch \
    file://0004-arm64-dts-iesy-iesy-imx8mm-eva-mi-config-usdhc1-for-.patch \
    file://0005-spi-add-m95m04-to-spidev.patch \
    file://0006-arm64-dts-iesy-iesy-imx8mm-eva-mi-add-SPI-B.patch \
    file://0007-arm64-dts-iesy-iesy-imx8mm-eva-mi-fix-PCIe.patch \
    file://0008-driver-net-phy-config-eth-phy-behavior.patch \
    file://0009-arm64-dts-iesy-iesy-imx8mm-osm-sf-fix-UART-B.patch \
    file://0010-arm64-dts-iesy-iesy-imx8mm-osm-sf-add-DMIC.patch \
    file://0011-arm64-dts-iesy-set-HW-revision-for-i.MX8-evaluation-.patch \
    file://0012-arm64-dts-iesy-move-i2c2-pinmux-to-module.patch \
    file://0013-arm64-dts-iesy-disable-critical-trip-point.patch \
    file://0014-gpu-drm-bridge-revert-d89078c37b10f05fa4f4791b71db25.patch \
"