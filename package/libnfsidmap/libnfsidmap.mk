################################################################################
#
# libnfsidmap
#
################################################################################

LIBNFSIDMAP_VERSION = 0.26
LIBNFSIDMAP_SOURCE = libnfsidmap-$(LIBNFSIDMAP_VERSION).tar.bz2
LIBNFSIDMAP_SITE = https://fedorapeople.org/~steved/libnfsidmap/$(LIBNFSIDMAP_VERSION)
LIBNFSIDMAP_LICENSE = CUSTOM
LIBNFSIDMAP_LICENSE_FILES = COPYING
LIBNFSIDMAP_INSTALL_STAGING = YES
LIBNFSIDMAP_AUTORECONF = YES
LIBNFSIDMAP_DEPENDENCIES = host-pkgconf

LIBNFSIDMAP_CONF_OPTS = --disable-ldap

#define LIBNFSIDMAP_INSTALL_LIBTOOL
#	libtool --finish /usr/lib
#	libtool --finish /usr/lib/libnfsidmap
#endef

#LIBNFSIDMAP_POST_INSTALL_TARGET_HOOKS += LIBNFSIDMAP_INSTALL_LIBTOOL

$(eval $(autotools-package))
