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
PACKAGES-$(PTXCONF_KODI) += kodi

#
# Paths and names
#
KODI_VERSION	:= 21.0-Omega
KODI_MD5	:= 74501a89f0ea23d2908a9b983ab3d6f8
KODI		:= xbmc-$(KODI_VERSION)
KODI_SUFFIX	:= tar.gz
KODI_URL	:= https://github.com/xbmc/xbmc/archive/$(KODI_VERSION).$(KODI_SUFFIX)
KODI_SOURCE	:= $(SRCDIR)/$(KODI).$(KODI_SUFFIX)
KODI_DIR	:= $(BUILDDIR)/$(KODI)
KODI_LICENSE	:= GPL-2.0-or-later
KODI_LICENSE_FILES	:= \
	file://LICENSE.md;md5=7b423f1c9388eae123332e372451a4f7 \
	file://LICENSES/README.md;md5=9de0d5d062a1afdda9ce6e5e526996ef

#
# cmake
#

KODI_CONF_TOOL	:= cmake
KODI_CONF_OPT	:= \
	$(CROSS_CMAKE_USR) \
	-DENABLE_DVDCSS=$(call ptx/onoff, PTXCONF_KODI_DVDCSS) \
	-DENABLE_UPNP=$(call ptx/onoff, PTXCONF_KODI_UPNP) \
	-DENABLE_AIRTUNES=$(call ptx/onoff, PTXCONF_KODI_AIRTUNES) \
	-DENABLE_OPTICAL=$(call ptx/onoff, PTXCONF_KODI_OPTICAL) \
	-DENABLE_PYTHON=$(call ptx/onoff, PTXCONF_KODI_PYTHON) \
	-DENABLE_TESTING=OFF \
	-DENABLE_INTERNAL_CROSSGUID=OFF \
	-DENABLE_INTERNAL_RapidJSON=OFF \
	-DENABLE_INTERNAL_FLATBUFFERS=OFF \
	-DENABLE_INTERNAL_FMT=OFF \
	-DENABLE_INTERNAL_NFS=OFF \
	-DENABLE_INTERNAL_PCRE=OFF \
	-DENABLE_INTERNAL_SPDLOG=OFF \
	-DENABLE_INTERNAL_TAGLIB=OFF \
	-DENABLE_INTERNAL_FSTRCMP=OFF \
	-DENABLE_INTERNAL_DAV1D=OFF \
	-DENABLE_INTERNAL_GTEST=OFF \
	-DENABLE_INTERNAL_UDFREAD=OFF \
	-DENABLE_INTERNAL_KISSFFT=OFF \
	-DUSE_INTERNAL_LIBS=OFF \
	-DFLATBUFFERS_FLATC_EXECUTABLE=$(PTXDIST_SYSROOT_HOST)/usr/bin/flatc \
	-DCORE_PLATFORM_NAME=WAYLAND \
	-DAPP_RENDER_SYSTEM=gles \
	-DWITH_FFMPEG=$(PTXDIST_SYSROOT_TARGET)/usr \
	-DWITH_JSONSCHEMABUILDER=$(PTXDIST_SYSROOT_HOST)/usr/bin/JsonSchemaBuilder \
	-DWITH_TEXTUREPACKER=$(PTXDIST_SYSROOT_HOST)/usr/bin/TexturePacker \
	-DWITH_WAYLANDSCANNER=$(PTXDIST_SYSROOT_HOST)/usr/bin/wayland-scanner++ \
	-Dgroovy_SOURCE_DIR=$(PTXDIST_SYSROOT_CROSS)/usr/share/groovy \
	-Dapache-commons-lang_SOURCE_DIR=$(PTXDIST_SYSROOT_CROSS)/usr/share/java/lang \
	-Dapache-commons-text_SOURCE_DIR=$(PTXDIST_SYSROOT_CROSS)/usr/share/java/text \
	-Wno-dev

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/kodi.targetinstall:
	@$(call targetinfo)

	@$(call install_init, kodi)
	@$(call install_fixup, kodi, PRIORITY, optional)
	@$(call install_fixup, kodi, SECTION, base)
	@$(call install_fixup, kodi, AUTHOR, "Ladislav Michl <ladis@linux-mips.org>")
	@$(call install_fixup, kodi, DESCRIPTION, missing)

	@$(call install_copy, kodi, 0, 0, 0755, -, /usr/bin/kodi)
	@$(call install_copy, kodi, 0, 0, 0755, -, /usr/bin/kodi-standalone)

	@$(call install_copy, kodi, 0, 0, 0755, -, /usr/lib/kodi/kodi-wayland)

	@$(call install_tree, kodi, 0, 0, -, /usr/share/kodi/addons)
	@$(call install_tree, kodi, 0, 0, -, /usr/share/kodi/media)
	@$(call install_tree, kodi, 0, 0, -, /usr/share/kodi/system)
	@$(call install_tree, kodi, 0, 0, -, /usr/share/kodi/userdata)

	@$(call install_finish, kodi)

	@$(call touch)

# vim: syntax=make
