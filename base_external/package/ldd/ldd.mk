
##############################################################
#
# LDD
#
##############################################################

# below is the original unedited commit
LDD_VERSION = 5c3cae6ddc96b8645dfa6f6bc4ddbba08aae8789

LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-ryanchallacombe.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES
LDD_MODULE_SUBDIRS = scull
LDD_MODULE_SUBDIRS += misc-modules

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/scull/* $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/* $(TARGET_DIR)/usr/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))
