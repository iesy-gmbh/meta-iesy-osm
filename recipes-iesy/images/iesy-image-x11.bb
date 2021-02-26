SUMMARY = "An image with native X11 support"
DESCRIPTION = "iesy sample image supporting X11"

IMAGE_FEATURES += "package-management x11"

inherit core-image features_check

REQUIRED_DISTRO_FEATURES = "x11"

DEPENDS += " xf86-video-imx-vivante"
