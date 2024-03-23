# -*-makefile-*-
#
# Copyright (C) 2023 by Ladislav Michl <ladis@linux-mips.org>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
HOST_PACKAGES-$(PTXCONF_HOST_TEXTUREPACKER) += host-texturepacker

HOST_TEXTUREPACKER_VERSION	 = $(HOST_KODI_VERSION)
HOST_TEXTUREPACKER_DIR		 = $(HOST_KODI_DIR)
HOST_TEXTUREPACKER_SUBDIR	:= tools/depends/native/TexturePacker/src

#
# cmake
#
HOST_TEXTUREPACKER_CONF_TOOL	:= cmake
HOST_TEXTUREPACKER_BUILD_DIR	 = $(HOST_TEXTUREPACKER_DIR)-TexturePacker-build
HOST_TEXTUREPACKER_CONF_OPT	 = \
	$(HOST_CMAKE_OPT) \
	-B$(HOST_TEXTUREPACKER_BUILD_DIR) \
	-DARCH_DEFINES=-DTARGET_POSIX \
	-DKODI_SOURCE_DIR=$(HOST_KODI_DIR) \
	-DNATIVEPREFIX=$(PTXDIST_SYSROOT_HOST)
HOST_TEXTUREPACKER_INSTALL_OPT	:= \
	install \
	DESTDIR=$(PTXDIST_SYSROOT_HOST)
