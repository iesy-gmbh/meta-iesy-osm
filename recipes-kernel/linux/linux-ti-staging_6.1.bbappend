FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}_6.1:"

SRC_URI += " \
    file://0001-arm64-dts-add-support-for-iesy-AM62XX-SoM-OSM-L-and-.patch \
    file://0002-arm64-dts-ti-iesy-am62x-config-memory.patch \
    file://0003-arm64-dts-ti-iesy-am62x-update-regulators-for-sd-car.patch \
    file://0004-arm64-dts-ti-iesy-am62x-add-PMIC-TPS65219.patch \
    file://0005-arm64-dts-ti-iesy-am62x-config-eth-phy-sort-nodes.patch \
    file://0006-driver-net-phy-config-eth-phy-behavior.patch \
"

do_patch(){
    cd ${S}
    git am ${WORKDIR}/*.patch
}
