SUMMARY = "An image with native X11 support"
DESCRIPTION = "iesy sample image supporting X11. Uses Openbox as window manager."

IMAGE_FEATURES += "package-management x11"

inherit core-image features_check

REQUIRED_DISTRO_FEATURES = "x11"

CORE_IMAGE_BASE_INSTALL += "\
    openbox \
    xterm \
    liberation-fonts \
    "

DEPENDS += " xf86-video-imx-vivante"
