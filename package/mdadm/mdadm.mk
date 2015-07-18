################################################################################
#
# mdadm
#
################################################################################

MDADM_VERSION = 3.3.4
MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.xz
MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
MDADM_LICENSE = GPLv2+
MDADM_LICENSE_FILES = COPYING

MDADM_MAKE_OPTS = \
	CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" CHECK_RUN_DIR=0 -C $(MDADM_DIR) mdadm

MDADM_INSTALL_TARGET_OPTS = \
	DESTDIR=$(TARGET_DIR)/usr -C $(MDADM_DIR) install-mdadm

ifeq ($(BR2_PACKAGE_SYSTEMD),y)
MDADM_INSTALL_TARGET_OPTS += \
	SYSTEMD_DIR=/lib/systemd/system install-systemd-mdadm \
	UDEVDIR=/lib/udev install-udev
endif

define MDADM_INSTALL_INIT_SYSTEMD
	#mkdir -p $(TARGET_DIR)/etc/systemd/system/
	#ln -sf ../../../../lib/systemd/system-shutdown/mdadm.shutdown \
	#	$(TARGET_DIR)/etc/systemd/system/mdadm.shutdown
endef

define MDADM_CONFIGURE_CMDS
	# Do nothing
endef

$(eval $(autotools-package))
