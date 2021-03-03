SUMMARY = "An image with native X11 support"
DESCRIPTION = "iesy sample image supporting X11. Uses Openbox as window manager."

IMAGE_FEATURES += "package-management x11"

inherit core-image features_check

REQUIRED_DISTRO_FEATURES = "x11 sysvinit"

CORE_IMAGE_BASE_INSTALL_remove = "packagegroup-core-boot"

CORE_IMAGE_BASE_INSTALL += "\
    packagegroup-core-boot-sysvinit \
    openbox \
    xterm \
    liberation-fonts \
    "

DEPENDS += " xf86-video-imx-vivante"
