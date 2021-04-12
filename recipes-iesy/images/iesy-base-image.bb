SUMMARY = "A default sample image supporting all different iesy distributions"
DESCRIPTION = "iesy sample image supporting iesy-wayland, iesy-x11 and iesy-fb distros."

IMAGE_FEATURES += "package-management"

inherit core-image features_check

WAYLAND_INSTALL = " \
    weston \
    weston-init \
    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'weston-xwayland', '', d)} \
    weston-examples \
    "

CORE_IMAGE_BASE_INSTALL += "\
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '${WAYLAND_INSTALL}', '', d)} \
    "
