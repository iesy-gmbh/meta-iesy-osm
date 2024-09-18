FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

OVERRIDES:append = ":${PV}"

SRC_URI:append = " file://0002-arm64-imx8mm-add-Uart-3-4-to-RDC-change-Uart-Base-Ad.patch"

# for imx-atf_2.8
SRC_URI:remove:2.8+git = " file://0002-arm64-imx8mm-add-Uart-3-4-to-RDC-change-Uart-Base-Ad.patch"
SRC_URI:append:2.8+git = " file://0001-arm64-imx8mm-add-Uart-3-4-to-RDC-change-Uart-Base-Ad.patch"

do_patch () {
    cd ${S}
    git am ${WORKDIR}/*.patch
}