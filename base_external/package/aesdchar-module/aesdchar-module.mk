
##############################################################
#
# AESDCHAR-MODULE
#
##############################################################

# Fill up the contents below in order to reference your assignment 3 git contents
AESDCHAR_MODULE_VERSION = 0ff4aa9d62de4fa4651c83f3f05971e5b2c2a5a7		# updated for assignment 8

# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESDCHAR_MODULE_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-ryanchallacombe.git
AESDCHAR_MODULE_SITE_METHOD = git
AESDCHAR_MODULE_GIT_SUBMODULES = YES
AESDCHAR_MODULE_SUBDIRS += aesd-char-driver


define AESDCHAR_MODULE_INSTALL_TARGET_CMDS

	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin
									
endef
#$(INSTALL) -m 0755 $(@D)/aesd-char-driver/S97aesdcharmodule $(TARGET_DIR)/etc/init.d/S97aesdcharmodule

$(eval $(kernel-module))
$(eval $(generic-package))
