
##############################################################
#
# LDD
#
##############################################################


#AESD_ASSIGNMENTS_VERSION = 91e915ca155d0bd2e2b13fffda97b2e5c14a4df9
LDD_VERSION = 91e915ca155d0bd2e2b13fffda97b2e5c14a4df9

# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-ryanchallacombe.git
LDD_METHOD = git
LDD_GIT_SUBMODULES = YES
LDD_MODULE_SUBDIRS += scull
LDD_MODULE_SUBDIRS += misc-modules

#define LDD_BUILD_CMDS
#	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
#	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all 
#endef

define LDD_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc-modules modules
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/scull modules 
endef


#define LDD_INSTALL_TARGET_CMDS
#	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
#	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
#	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/usr/bin
#	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin
#	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin
#	$(INSTALL) -m 0755 $(@D)/finder-app/Makefile $(TARGET_DIR)/usr/bin
#	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin
#	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin
#	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop.sh $(TARGET_DIR)/etc/init.d/S99aesdsocket						
#endef

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(@D)/misc-modules $(TARGET_DIR)/etc/misc-modules/
	$(INSTALL) -d 0755 $(@D)/scull $(TARGET_DIR)/etc/scull/
	$(INSTALL) -m 0755 $(@D)/scull/* $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/* $(TARGET_DIR)/usr/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))
