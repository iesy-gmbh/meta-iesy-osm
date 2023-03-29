FILESEXTRAPATHS:prepend := "${THISDIR}/base-files:"

SRC_URI += " \
    file://issue \
    file://issue.net \
    "

do_install_basefilesissue () {
	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
	sed -i 's#MACHINE_NAME#${MACHINE_NAME}#' ${D}${sysconfdir}/issue
	sed -i 's#MACHINE_NAME#${MACHINE_NAME}#' ${D}${sysconfdir}/issue.net
	if [ -n "${DISTRO_VERSION}" ]; then
			sed -i 's#DISTRO_NAME#${DISTRO_NAME} ${DISTRO_VERSION}#' ${D}${sysconfdir}/issue
			sed -i 's#DISTRO_NAME#${DISTRO_NAME} ${DISTRO_VERSION}#' ${D}${sysconfdir}/issue.net
	else
			sed -i 's#DISTRO_NAME#${DISTRO_NAME}#' ${D}${sysconfdir}/issue
			sed -i 's#DISTRO_NAME#${DISTRO_NAME}#' ${D}${sysconfdir}/issue.net
	fi
}
