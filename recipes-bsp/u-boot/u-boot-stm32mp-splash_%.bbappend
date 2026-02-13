SUMMARY = "Universal Boot Loader Splash Screen for stm32mp embedded devices"
#TODO Need to review the exact license we want to have for the specific BMP we provide.
LICENSE = "Proprietary"
LIC_FILES_CHKSUM = "file://LICENSE;md5=ac3e0fd89b582e9fc11d534a27636636"

FILESEXTRAPATHS:prepend := "${THISDIR}/splash:"

SRC_URI += " \
	file://logo_800x480-24-bits.bmp \
	file://logo_480x800-24-bits.bmp \
	" 

S = "${WORKDIR}"

UBOOT_SPLASH_LANDSCAPE_SRC_FSE = "logo_800x480-24-bits.bmp"
UBOOT_SPLASH_PORTRAIT_SRC_FSE = "logo_480x800-24-bits.bmp"
UBOOT_SPLASH_LANDSCAPE_IMAGE_FSE = "splash_landscape"
UBOOT_SPLASH_PORTRAIT_IMAGE_FSE = "splash_portrait"

#UBOOT_SPLASH_LANDSCAPE_SRC = "ST_logo_2020_blue_H_rgb_rle8_480x183.bmp"
#UBOOT_SPLASH_PORTRAIT_SRC = "ST_logo_2020_blue_H_rgb_rle8_183x480.bmp"
#UBOOT_SPLASH_LANDSCAPE_IMAGE ?= "splash_landscape"
#UBOOT_SPLASH_PORTRAIT_IMAGE ?= "splash_portrait"

inherit deploy

do_compile[noexec] = "1"

do_install:append() {
	install -m 644 ${S}/${UBOOT_SPLASH_LANDSCAPE_SRC_FSE} ${D}/boot/${UBOOT_SPLASH_LANDSCAPE_IMAGE_FSE}.bmp
    install -m 644 ${S}/${UBOOT_SPLASH_PORTRAIT_SRC_FSE} ${D}/boot/${UBOOT_SPLASH_PORTRAIT_IMAGE_FSE}.bmp
}

ALLOW_EMPTY:${PN} = "0"
FILES:${PN} = "/boot"
