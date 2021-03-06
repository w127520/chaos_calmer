WIFI_SOURCE_7615:=MT7615_LinuxAP_V4.4.1.2_20170514.tar.bz2
WIFI_SOURCE_76x2:=MT76x2e_MT7620_LinuxAP_V3.0.4.0_DPA_20150618.tar.bz2
WIFI_SOURCE_7610:=mt7610e-p4rev-118062.tar.bz2
WIFI_SOURCE_7603:=MT7603e_LinuxAP_V4.0.1.0rev1_DPA_20150629.tar.bz2
WIFI_SOURCE_7620:=mt7620-p4rev-120998.tar.bz2
WIFI_SOURCE_7628:=mt7628-p4rev-120935.tar.bz2
FILE_7615_EXIT = $(shell if [ -a $(DL_DIR)/$(WIFI_SOURCE_7615) ];then echo "exist";else echo "notexit";fi;) 

FILE_76x2_EXIT = $(shell if [ -a $(DL_DIR)/$(WIFI_SOURCE_76x2) ];then echo "exist";else echo "notexit";fi;)
define wifi-prepare 

ifeq ($(FILE_76x2_EXIT),exist)
	@echo =======76x2 exist=======;
	@echo "Extract 76x2 wifi driver";
	rm -rf $(LINUX_DIR)/drivers/net/wireless/rlt_wifi*;
	$(TAR) -jxvf $(DL_DIR)/$(WIFI_SOURCE_76x2) -C $(LINUX_DIR)/drivers/net/wireless/;
	$(call PatchDir,$(PKG_BUILD_DIR),$(MT76x2_PATCH_DIR),mt76x2/)
endif

ifeq ($(CONFIG_PACKAGE_mt7615e), y)
	@echo =======7615 exist=======
	@echo "Extract 7615 wifi driver";
	cp -f $(TOPDIR)/package/ramips/patch_file/MT7615_LinuxAP_V4.4.1.2_20170514.tar.bz2  $(DL_DIR)/
	cp -f $(TOPDIR)/package/ramips/patch_file/1000-add-ramips-mt7615.patch $(TOPDIR)/target/linux/ramips/patches-3.18/
	cp -f $(TOPDIR)/package/ramips/patch_file/1604-mt7615-buildin.patch $(TOPDIR)/target/linux/ramips/patches-3.18/
	cp -rf $(TOPDIR)/package/ramips/ralink  $(LINUX_DIR);
	cp -f $(TOPDIR)/package/ramips/patch_file/ralink-flash*   $(LINUX_DIR)/drivers/mtd/maps/
	mkdir -p $(LINUX_DIR)/arch/mips/include/asm/rt2880
	mkdir -p $(LINUX_DIR)/user_headers/include/asm/rt2880
	cp -f $(TOPDIR)/package/ramips/patch_file/rt_mmap.h   $(LINUX_DIR)/arch/mips/include/asm/rt2880/
	cp -f $(TOPDIR)/package/ramips/patch_file/rt_mmap.h   $(LINUX_DIR)/user_headers/include/asm/rt2880/
	rm -rf $(LINUX_DIR)/drivers/net/wireless/mt_wifi*;
	$(TAR) -jxvf $(DL_DIR)/$(WIFI_SOURCE_7615) -C $(LINUX_DIR)/drivers/net/wireless/;
	$(call PatchDir,$(PKG_BUILD_DIR),$(MT7615_PATCH_DIR),mt7615/)
endif

ifeq ($(CONFIG_PACKAGE_kmod-mt7628), y)
	@echo =======7628 wifi=======
	@echo "Extract 7628 wifi driver";
	cp -f $(TOPDIR)/package/ramips/patch_file/MT7615_LinuxAP_V4.4.1.2_20170514.tar.bz2  $(DL_DIR)/
	cp -f $(TOPDIR)/package/ramips/patch_file/mt7628-p4rev-150355.tar.bz2  $(DL_DIR)/
	cp -f $(TOPDIR)/package/ramips/patch_file/1000-add-ramips-mt7615.patch $(TOPDIR)/target/linux/ramips/patches-3.18/
	cp -f $(TOPDIR)/package/ramips/patch_file/1604-mt7615-buildin.patch $(TOPDIR)/target/linux/ramips/patches-3.18/
	cp -rf $(TOPDIR)/package/ramips/ralink  $(LINUX_DIR);
	cp -f $(TOPDIR)/package/ramips/patch_file/ralink-flash*   $(LINUX_DIR)/drivers/mtd/maps/
	mkdir -p $(LINUX_DIR)/arch/mips/include/asm/rt2880
	mkdir -p $(LINUX_DIR)/user_headers/include/asm/rt2880
	cp -f $(TOPDIR)/package/ramips/patch_file/rt_mmap.h   $(LINUX_DIR)/arch/mips/include/asm/rt2880/
	cp -f $(TOPDIR)/package/ramips/patch_file/rt_mmap.h   $(LINUX_DIR)/user_headers/include/asm/rt2880/
	rm -rf $(LINUX_DIR)/drivers/net/wireless/mt_wifi*;
	$(TAR) -jxvf $(DL_DIR)/$(WIFI_SOURCE_7615) -C $(LINUX_DIR)/drivers/net/wireless/;
	$(call PatchDir,$(PKG_BUILD_DIR),$(MT7615_PATCH_DIR),mt7615/)
endif

endef
