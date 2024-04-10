FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}_6.1:"

# directory of this bbappend file, used to include the kernel config fragment
# THISDIR is only valid at parse time, so we need to store it in a variable
APPEND_DIR := "${THISDIR}/${BPN}_6.1"

SRC_URI += " \
    file://0001-arm64-dts-add-support-for-iesy-AM62XX-SoM-OSM-L-and-.patch \
    file://0002-arm64-dts-ti-iesy-am62x-config-memory.patch \
    file://0003-arm64-dts-ti-iesy-am62x-update-regulators-for-sd-car.patch \
    file://0004-arm64-dts-ti-iesy-am62x-add-PMIC-TPS65219.patch \
    file://0005-arm64-dts-ti-iesy-am62x-config-eth-phy-sort-nodes.patch \
    file://0006-driver-net-phy-config-eth-phy-behavior.patch \
    file://0007-dt-bindings-usb-Add-Microchip-USB253x-USB3x13-USB46x.patch \
    file://0008-arm64-dts-iesy-am62x-add-support-for-USB2534-hub.patch \
    file://0009-arm64-dts-iesy-am62x-remove-audio-hdmi-nodes-add-lvd.patch \
    file://0010-arm64-dts-ti-iesy-am62x-add-touchscreen-support.patch \
    file://0011-arm64-dts-ti-iesy-am62x-use-LVDS_BL_PWM-as-touchscre.patch \
    file://0012-arm64-dts-ti-iesy-am62x-add-leds.patch \
    file://0013-arm64-dts-ti-iesy-am62x-support-USB0-dual-role-port.patch \
    file://0014-arm64-dts-ti-iesy-am62x-add-user-buttons.patch \
    file://0015-arm64-dts-ti-iesy-am62x-add-Uart-A.patch \
    file://0016-arm64-dts-ti-iesy-am62x-add-Uart-C.patch \
    file://0017-arm64-dts-ti-iesy-am62x-add-eeprom-on-I2C-A.patch \
    file://0018-arm64-dts-ti-iesy-am62x-add-additional-eeproms-on-I2.patch \
"
KERNEL_CONFIG_FRAGMENTS:append = "\
    ${APPEND_DIR}/fragment.config \
"

do_patch(){
    cd ${S}
    git am ${WORKDIR}/*.patch
}
