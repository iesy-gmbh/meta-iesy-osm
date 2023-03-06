FILESEXTRAPATHS_prepend := "${THISDIR}/imx-atf:"

SRC_URI += " \
    file://0001-arm64-imx8mm-add-Uart-3-to-RDC-change-Uart-Base-Addr.patch \
    file://0002-Config-Uart.patch \
"