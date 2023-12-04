##############################################################
#
# LDD
#
# see https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_packages_building_kernel_modules (18.20)
#
##############################################################

#DONE: Fill up the contents below in order to reference your assignment 3 git contents
LDD_VERSION = 9bae7ebeb5945a0626fdcc1e5e62502eb94e5306
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-galazwoj.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES
LDD_MODULE_SUBDIRS = misc-modules
LDD_MODULE_SUBDIRS += scull
LDD_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

$(eval $(kernel-module))

define LDD_INSTALL_TARGET_MODULES
	$(INSTALL) -m 0755 $(@D)/scull/scull_load           $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload         $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load   $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin/

	$(INSTALL) -m 0755 $(@D)/S98lddmodules              $(TARGET_DIR)/etc/init.d/S98lddmodules
endef

LDD_POST_BUILD_HOOKS += LDD_INSTALL_TARGET_MODULES

$(eval $(generic-package))
