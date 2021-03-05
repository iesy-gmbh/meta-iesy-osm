SUMMARY = "An image supporting Wayland and XWayland"
DESCRIPTION = "iesy sample image supporting Wayland and XWayland. Uses Wayland compositor reference implementation Weston."

IMAGE_FEATURES += "package-management"

inherit core-image features_check

REQUIRED_DISTRO_FEATURES = "wayland x11"

CORE_IMAGE_BASE_INSTALL += "\
    weston \
    weston-init \
    weston-xwayland \
    weston-examples \
    "
