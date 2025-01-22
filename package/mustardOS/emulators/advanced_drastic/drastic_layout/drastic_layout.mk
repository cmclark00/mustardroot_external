################################################################################
#
# drastic_layout
#
################################################################################

DRASTIC_LAYOUT_VERSION = 3fb9aa23b95e7022dcfadface457f2f35e12405d
DRASTIC_LAYOUT_SITE = $(call github,trngaje,drastic_layout,$(DRASTIC_LAYOUT_VERSION))
DRASTIC_LAYOUT_DEPENDENCIES =

define DRASTIC_LAYOUT_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/advanced_drastic/resources/

	cp -r $(@D)/bg $(TARGET_DIR)/usr/share/advanced_drastic/resources/
endef

$(eval $(generic-package))
