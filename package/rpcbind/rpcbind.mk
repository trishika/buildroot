################################################################################
#
# rpcbind
#
################################################################################

RPCBIND_VERSION = 0.2.3
RPCBIND_SITE = http://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
RPCBIND_SOURCE = rpcbind-$(RPCBIND_VERSION).tar.bz2
RPCBIND_LICENSE = BSD-3c
RPCBIND_LICENSE_FILES = COPYING

RPCBIND_CONF_ENV += \
	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/tirpc/"
RPCBIND_DEPENDENCIES += libtirpc host-pkgconf
RPCBIND_CONF_OPTS += --with-rpcuser=root

ifeq ($(BR2_INIT_SYSTEMD),y)
	RPCBIND_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
else
	RPCBIND_CONF_OPTS += --with-systemdsystemunitdir=no
endif

define RPCBIND_INSTALL_INIT_SYSTEMD
	$(INSTALL) -m 0755 -D package/rpcbind/rpcbind.service \
		$(TARGET_DIR)/usr/lib/systemd/system/rpcbind.service
	$(INSTALL) -m 0755 -D package/rpcbind/rpcbind.socket \
		$(TARGET_DIR)/usr/lib/systemd/system/rpcbind.socket
	mkdir -p $(TARGET_DIR)/etc/systemd/system/sockets.target.wants
	ln -fs ../../../../usr/lib/systemd/system/rpcbind.socket \
		$(TARGET_DIR)/etc/systemd/system/sockets.target.wants/rpcbind.socket
endef

define RPCBIND_INSTALL_INIT_SYSV
	$(INSTALL) -m 0755 -D package/rpcbind/S30rpcbind \
		$(TARGET_DIR)/etc/init.d/S30rpcbind
endef


$(eval $(autotools-package))
