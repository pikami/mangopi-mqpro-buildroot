CUSTOM_RTL8723DS_VERSION = 09a2b3e94d14cc2a0012d5b74101c6acf1ef0872
CUSTOM_RTL8723DS_SITE = https://github.com/amazingfate/rtl8723ds.git
CUSTOM_RTL8723DS_SITE_METHOD = git

define CUSTOM_RTL8723DS_BUILD_CMDS
    $(MAKE) -C $(@D) ARCH=riscv CROSS_COMPILE=$(TARGET_CROSS) \
        CONFIG_RTL8723DS=m \
        KVER=$(LINUX_VERSION_PROBED) \
        KSRC=$(LINUX_DIR) \
        MODULE_NAME=8723ds
endef

define CUSTOM_RTL8723DS_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/kernel/drivers/net/wireless/
    cp $(@D)/8723ds.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/kernel/drivers/net/wireless/
endef

$(eval $(kernel-module))
$(eval $(generic-package))