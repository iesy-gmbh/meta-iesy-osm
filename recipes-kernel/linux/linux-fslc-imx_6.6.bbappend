FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI += " \
    file://fragment.cfg \
    file://0001-arm64-dts-iesy-Add-support-for-iesy-imx8mm.patch \
    file://0002-spi-add-m95m04-to-spidev.patch \
    file://0003-driver-net-phy-config-eth-phy-behavior.patch \
    file://0004-gpu-drm-bridge-revert-d89078c37b10f05fa4f4791b71db25.patch \
    file://0005-arm64-boot-dts-iesy-add-support-for-iesy-imx93-eva-m.patch \
    file://0006-arm64-boot-dts-iesy-add-user-leds-for-iesy-imx93-eva.patch \
    file://0007-arm64-boot-dts-iesy-add-user-buttons-for-iesy-imx93-.patch \
    file://0008-arm64-boot-dts-iesy-add-usb-a-functionality-for-iesy.patch \
    file://0009-arm64-boot-dts-iesy-add-ti-lm75-for-iesy-imx93-eva-m.patch \
    file://0010-arm64-boot-dts-iesy-add-ethernet-a-phy.patch \
    file://0011-arm64-boot-dts-iesy-add-ethernet-b-phy.patch \
    file://0012-arm64-boot-dts-iesy-add-rtc-for-iesy-imx93-eva-mi.patch \
    file://0013-arm64-boot-dts-iesy-add-eeproms-for-iesy-imx93-eva-m.patch \
    file://0014-arm64-boot-dts-iesy-add-line-names-to-gpio-A.patch \
    file://0015-arm64-boot-dts-iesy-split-eval-kit-into-baseboard-an.patch \
"