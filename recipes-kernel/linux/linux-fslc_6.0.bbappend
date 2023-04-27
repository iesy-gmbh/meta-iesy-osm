FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}_${LINUX_VERSION}:"

SRC_URI += " \
    file://fragment.cfg \
    file://0001-arm64-dts-iesy-add-iesy-imx8mm-eva-mi.dts.patch \
    file://0002-arm64-dts-iesy-fix-typo-in-iesy-imx8mm-eva-mi.dts.patch \
    file://0003-arm64-dts-iesy-set-pmic-regulators-always-on.patch \
    file://0004-arm-dts-iesy-adapt-eeprom-compatible-string-to-kerne.patch \
"


unset KBUILD_DEFCONFIG
