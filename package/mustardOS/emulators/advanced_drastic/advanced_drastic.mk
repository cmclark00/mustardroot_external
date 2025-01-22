################################################################################
#
# advanced_drastic
#
################################################################################

ADVANCED_DRASTIC_VERSION = eaf41ab9bc8adcc15c010bf9517bc94c38e7bffd
ADVANCED_DRASTIC_SITE = $(call github,trngaje,advanced_drastic,$(ADVANCED_DRASTIC_VERSION))
ADVANCED_DRASTIC_DEPENDENCIES = drastic_layout sdl2_drastic

define ADVANCED_DRASTIC_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/advanced_drastic

	cp -r $(@D)/* $(TARGET_DIR)/usr/share/advanced_drastic
endef

$(eval $(generic-package))
