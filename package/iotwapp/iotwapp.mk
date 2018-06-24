IOTWAPP_VERSION = 1.0
IOTWAPP_DEPENDENCIES = libxml2 libcurl

IOTWAPP_OVERRIDE_SRCDIR = $(TOPDIR)/../iotwapp
IOTWAPP_INSTALL_TARGET = YES

define IOTWAPP_BUILD_CMDS
     $(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D) all
endef

define IOTWAPP_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/iotwapp $(TARGET_DIR)/usr/bin/
	$(INSTALL) -D -m 0755 $(@D)/iotwapp_console $(TARGET_DIR)/usr/bin/
	$(INSTALL) -D -m 0755 $(@D)/iotwapp_testing $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
