#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/phicomm-k2p
	NAME:=Phicomm K2p
endef

define Profile/phicomm-k2p/Description
	Package set compatible with the Phicomm K2p board.
endef
$(eval $(call Profile,phicomm-k2p))
