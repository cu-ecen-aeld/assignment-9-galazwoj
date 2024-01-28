##############################################################
#
# AESD-CHAR
#
##############################################################

#DONE: Fill up the contents below in order to reference your assignment 3 git contents
AESD_CHAR_VERSION = f63943290c268168800728c04429926360edf10a
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_CHAR_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-galazwoj.git
AESD_CHAR_SITE_METHOD = git
AESD_CHAR_GIT_SUBMODULES = YES

AESD_CHAR_MODULE_SUBDIRS = aesd-char-driver
AESD_CHAR_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

# see https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_packages_building_kernel_modules (18.20)

$(eval $(kernel-module))

define AESD_CHAR_INSTALL_TARGET_MODULES
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load           $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload         $(TARGET_DIR)/usr/bin/
endef

AESD_CHAR_POST_BUILD_HOOKS += AESD_CHAR_INSTALL_TARGET_MODULES

$(eval $(generic-package))
 
