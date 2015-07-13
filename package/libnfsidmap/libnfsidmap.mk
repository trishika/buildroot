################################################################################
#
# libnfsidmap
#
################################################################################

LIBNFSIDMAP_VERSION = 0.25
LIBNFSIDMAP_SOURCE = libnfsidmap-$(LIBNFSIDMAP_VERSION).tar.gz
LIBNFSIDMAP_SITE = http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap/
LIBNFSIDMAP_LICENSE = CUSTOM
LIBNFSIDMAP_LICENSE_FILES = COPYING
LIBNFSIDMAP_AUTORECONF = YES
LIBNFSIDMAP_DEPENDENCIES = host-pkgconf

LIBNFSIDMAP_CONF_OPTS = --disable-ldap

define LIBNFSIDMAP_INSTALL_LIBTOOL
	libtool --finish /usr/lib
	libtool --finish /usr/lib/libnfsidmap
endef

LIBNFSIDMAP_POST_INSTALL_TARGET_HOOKS += LIBNFSIDMAP_INSTALL_LIBTOOL

$(eval $(autotools-package))
