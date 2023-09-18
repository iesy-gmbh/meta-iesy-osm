SUMMARY = "A default sample image supporting all different iesy distributions"
DESCRIPTION = "iesy sample image supporting iesy-wayland, iesy-x11 and iesy-fb distros."

IMAGE_FEATURES += " \
    package-management \
    ${@bb.utils.contains('DISTRO', 'iesy-x11', 'x11', '', d)} \
    "

# Classes nonsense inside meta-rockchip by creating new "features_check.bbclass" with the same name as the
# original one from poky forces us to specify our own bbclass here (pointing to poky) to keep it clean and
# not being dependent on the user's bblayers.conf.
# Some background: https://www.yoctoproject.org/pipermail/yocto/2012-January/004376.html
inherit core-image ${@'features_check-poky' if "meta-rockchip" in d.getVar('BBLAYERS') else ''}

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
    i2c-tools \
    glmark2 \
    sysbench \
    iperf3 \
    usbutils \
    ${@bb.utils.contains('MACHINE_NAME', 'RPX30', 'gstreamer1.0-rockchip', '', d)} \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-good \
    alsa-utils \
    "

IMX_ALSA_EXTRA = "imx-alsa-plugins"