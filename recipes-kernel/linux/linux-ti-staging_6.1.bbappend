FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}_6.1:"

SRC_URI += " \
    file://0001-arm64-dts-add-support-for-iesy-AM62XX-SoM-OSM-L-and-.patch \
"

do_patch(){
    cd ${S}
    git am ${WORKDIR}/*.patch
}
