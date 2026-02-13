SUMMARY = "Client for Wi-Fi Protected Access (WPA)"
DESCRIPTION = "wpa_supplicant is a WPA Supplicant for Linux, BSD, Mac OS X, and Windows with support for WPA and WPA2 (IEEE 802.11i / RSN). Supplicant is the IEEE 802.1X/WPA component that is used in the client stations. It implements key negotiation with a WPA Authenticator and it controls the roaming and IEEE 802.11 authentication/association of the wlan driver."
HOMEPAGE = "http://w1.fi/wpa_supplicant/"
BUGTRACKER = "http://w1.fi/security/"
SECTION = "network"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
DEPENDS = "dbus libnl"
CVE_PRODUCT = "wpa_supplicant"

S = "${WORKDIR}/wpa_supplicant-${PV}"

SRC_URI += "file://wpa_supplicant.conf"

do_install:append () {
	install -d ${D}${sysconfdir}
	install -m 600 ${WORKDIR}/wpa_supplicant.conf ${D}${sysconfdir}
}
