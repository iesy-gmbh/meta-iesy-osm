SUMMARY = "A default sample image supporting all different iesy distributions"
DESCRIPTION = "iesy sample image supporting iesy-wayland, iesy-x11 and iesy-fb distros."

USE_WAYLAND = "${@bb.utils.contains("DISTRO", "iesy-wayland", "yes", "no", d)}"
USE_X11 = "${@bb.utils.contains("DISTRO", "iesy-x11", "yes", "no", d)}"

IMAGE_FEATURES += " \
    ${@bb.utils.contains('USE_WAYLAND', 'yes', 'package-management', '', d)} \
    ${@bb.utils.contains('USE_X11', 'yes', 'package-management x11', '', d)} \
    "

inherit core-image features_check

WAYLAND_INSTALL = " \
    weston \
    weston-init \
    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'weston-xwayland', '', d)} \
    weston-examples \
    "

X11_INSTALL = " \
    openbox \
    xterm \
    liberation-fonts \
    "

CORE_IMAGE_BASE_INSTALL += "\
    ${@bb.utils.contains('USE_WAYLAND', 'yes', '${WAYLAND_INSTALL}', '', d)} \
    ${@bb.utils.contains('USE_X11', 'yes', '${X11_INSTALL}', '', d)} \
    "
