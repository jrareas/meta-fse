SUMMARY = "Startup script and systemd unit file for the Weston Wayland compositor"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

PACKAGE_ARCH = "${MACHINE_ARCH}"

do_install:append() {
	echo "[output]" >>  ${D}${sysconfdir}/xdg/weston/weston.ini
	echo "name=DSI-1" >>  ${D}${sysconfdir}/xdg/weston/weston.ini                                          
	echo "mode=preferred" >>  ${D}${sysconfdir}/xdg/weston/weston.ini                                          
	echo "transform=rotate-90" >>  ${D}${sysconfdir}/xdg/weston/weston.ini                                          
}

FILES:${PN} += "\
    ${sysconfdir}/xdg/weston/weston.ini \
    "

CONFFILES:${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/default/weston"

SYSTEMD_SERVICE:${PN} = "weston.service weston.socket"
USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render,wayland weston"
GROUPADD_PARAM:${PN} = "-r wayland; -r render"

