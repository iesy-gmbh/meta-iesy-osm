FILESEXTRAPATHS:prepend := "${THISDIR}/imx-atf:"

SRC_URI += " \
    file://0001-arm64-imx8mm-add-Uart-3-4-to-RDC-change-Uart-Base-Ad.patch \
    file://0002-arm64-imx8mm-change-RAM-size-to-1GB.patch \
"