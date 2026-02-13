SUMMARY = "Network Time Protocol daemon and utilities"
DESCRIPTION = "The Network Time Protocol (NTP) is used to \
synchronize the time of a computer client or server to \
another server or reference time source, such as a radio \
or satellite receiver or modem."
HOMEPAGE = "http://support.ntp.org"
SECTION = "net"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

#SRC_URI = "file://ntp.conf"


do_install:append() {
	echo "server 0.ca.pool.ntp.org" >> ${D}${sysconfdir}/ntp.conf
	echo "server 1.ca.pool.ntp.org" >> ${D}${sysconfdir}/ntp.conf
	echo "server 2.ca.pool.ntp.org" >> ${D}${sysconfdir}/ntp.conf
	echo "server 3.ca.pool.ntp.org" >> ${D}${sysconfdir}/ntp.conf
}
