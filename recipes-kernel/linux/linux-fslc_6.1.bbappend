FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}_${LINUX_VERSION}:"

SRC_URI += " \
    file://fragment.cfg \
    file://0001-arm64-dts-iesy-add-iesy-imx8mm-eva-mi.dts.patch \
    file://0002-arm64-dts-iesy-fix-typo-in-iesy-imx8mm-eva-mi.dts.patch \
    file://0003-arm64-dts-iesy-set-pmic-regulators-always-on.patch \
    file://0004-arm-dts-iesy-adapt-eeprom-compatible-string-to-kerne.patch \
    file://0005-arm-dts-iesy-split-eval-kit-into-baseboard-and-som.patch \
    file://0006-arm64-dts-iesy-add-qspi-and-acc-sensor-change-eeprom.patch \
    file://0007-drivers-spi-spidev-add-mc3630-m95m04-to-generic-driv.patch \
    file://0008-arm64-dts-iesy-change-audio-codec-to-max9867.patch \
    file://0009-arm64-dts-iesy-change-i2c-eeprom-addr.patch \
    file://0010-arm64-dts-iesy-add-rtc-pcf85263.patch \
    file://0012-arm64-dts-iesy-change-button-pinconfig.patch \
    file://0013-arm64-dts-iesy-add-vsc8541.patch \
    file://0014-drivers-net-phy-config-eth-phy-led-behavior.patch \
    file://0015-arm64-dts-iesy-add-pcie-nodes.patch \
    file://0016-arm64-dts-iesy-add-audio-codec-soundcard-and-sai5.patch \
    file://0017-arm64-dts-iesy-move-SPI-interfaces-to-SoM-keep-onboa.patch \
"