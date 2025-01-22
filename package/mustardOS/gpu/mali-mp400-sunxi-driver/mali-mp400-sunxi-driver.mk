################################################################################
#
# mali-mp400-sunxi-driver
#
################################################################################

MALI_MP400_SUNXI_DRIVER_VERSION = 10fe95c50bbb905612493eb2a507bbb4b8d3e98d
MALI_MP400_SUNXI_DRIVER_SITE = $(call github,acm-cfw,linux-z7213,$(MALI_MP400_SUNXI_DRIVER_VERSION))
MALI_MP400_SUNXI_DRIVER_DEPENDENCIES = linux
MALI_MP400_SUNXI_DRIVER_LICENSE = GPL-2.0
MALI_MP400_SUNXI_DRIVER_LICENSE_FILES = LICENSE

MALI_MP400_SUNXI_DRIVER_DEPENDENCIES = host-toolchain-optional-linaro-arm mali-mp400-sunxi

MALI_MP400_SUNXI_DRIVER_MAKE_OPTS = \
	$(LINUX_MAKE_FLAGS) \
	KDIR=$(LINUX_DIR)

define MALI_MP400_SUNXI_DRIVER_BUILD_CMDS
	cd $(@D)/modules/mali/DX910-SW-99002-r4p0-00rel0/driver/src/devicedrv/mali \
		&& $(MALI_MP400_SUNXI_DRIVER_MAKE_OPTS) make USING_UMP=0 BUILD=release 
endef

define MALI_MP400_SUNXI_DRIVER_INSTALL_TARGET_CMDS
	cp $(@D)/modules/mali/DX910-SW-99002-r4p0-00rel0/driver/src/devicedrv/mali/mali.ko \
		$(TARGET_DIR)/lib/modules/3.4.113/kernel/drivers/mali.ko
endef

$(eval $(generic-package))
