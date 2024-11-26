do_install:append:iesy-imx93-eva-mi() {
    sed -i '/^\[core\]/a\backend=drm-backend.so' ${D}${sysconfdir}/xdg/weston/weston.ini

    install -d ${D}${sysconfdir}/udev/rules.d
    echo 'SUBSYSTEM=="dma_heap", KERNEL=="linux,cma*", GROUP="video", MODE="0660"' >> ${D}${sysconfdir}/udev/rules.d/99-weston-rule.rules
    echo 'KERNEL=="pxp_device", GROUP="video", MODE="0660"' >> ${D}${sysconfdir}/udev/rules.d/99-weston-rule.rules
}
