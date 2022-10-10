SUMMARY = "A default sample image supporting all different iesy distributions"
DESCRIPTION = "iesy sample image supporting iesy-wayland, iesy-x11 and iesy-fb distros."

IMAGE_FEATURES += " \
    package-management \
    ${@bb.utils.contains('DISTRO', 'iesy-x11', 'x11', '', d)} \
    "

inherit core-image features_check

IMAGE_FEATURES += " \
    ssh-server-openssh \
    "

# This would also be set by default in local.conf. debug-tweaks is useful for development purposes.
# - debug-tweaks        - makes an image suitable for development, e.g. allowing passwordless root logins
#   - empty-root-password
#   - allow-empty-password
#   - allow-root-login
#   - post-install-logging
EXTRA_IMAGE_FEATURES = "debug-tweaks"

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
    ${@bb.utils.contains('DISTRO', 'iesy-wayland', '${WAYLAND_INSTALL}', '', d)} \
    ${@bb.utils.contains('DISTRO', 'iesy-x11', '${X11_INSTALL}', '', d)} \
    "
