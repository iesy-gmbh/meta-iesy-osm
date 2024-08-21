FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI += " \
    file://fragment.cfg \
    file://0001-arm64-dts-iesy-Add-support-for-iesy-imx8mm.patch \
    file://0002-spi-add-m95m04-to-spidev.patch \
    file://0003-driver-net-phy-config-eth-phy-behavior.patch \
    file://0004-gpu-drm-bridge-revert-d89078c37b10f05fa4f4791b71db25.patch \
    file://0005-arm64-boot-dts-iesy-add-support-for-iesy-imx93-eva-m.patch \
    file://0006-arm64-boot-dts-iesy-add-user-leds-for-iesy-imx93-eva.patch \
"