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
PACKAGES-$(PTXCONF_KISSFFT) += kissfft

#
# Paths and names
#
KISSFFT_VERSION		:= 131.1.0
KISSFFT_MD5		:= 981ad3e496fbd8edb99704fc0e2aa939
KISSFFT			:= kissfft-$(KISSFFT_VERSION)
KISSFFT_SUFFIX		:= tar.gz
KISSFFT_URL		:= https://github.com/mborgerding/kissfft/archive/$(KISSFFT_VERSION).$(KISSFFT_SUFFIX))
KISSFFT_SOURCE		:= $(SRCDIR)/$(KISSFFT).$(KISSFFT_SUFFIX)
KISSFFT_DIR		:= $(BUILDDIR)/$(KISSFFT)
KISSFFT_LICENSE		:= BSD-3-Clause
KISSFFT_LICENSE_FILES	:= \
	file://COPYING;md5=6dae13f6990c3d2cacc8326c4bf36457 \
	file://LICENSES/BSD-3-Clause;md5=b7e9798596b65245c4127bf4accdbee2

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#
# cmake
#
KISSFFT_CONF_TOOL	:= cmake
KISSFFT_CONF_OPT	:= \
	$(CROSS_CMAKE_USR) \
	-DKISSFFT_DATATYPE=float \
	-DKISSFFT_STATIC=OFF \
	-DKISSFFT_PKGCONFIG=ON \
	-DKISSFFT_TEST=OFF \
	-DKISSFFT_TOOLS=OFF \
	-DCMAKE_INSTALL_INCLUDEDIR=include

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/kissfft.targetinstall:
	@$(call targetinfo)

	@$(call install_init, kissfft)
	@$(call install_fixup, kissfft,PRIORITY,optional)
	@$(call install_fixup, kissfft,SECTION,base)
	@$(call install_fixup, kissfft,AUTHOR,"Ladislav Michl <ladis@linux-mips.org>")
	@$(call install_fixup, kissfft,DESCRIPTION,missing)

	@$(call install_lib, kissfft, 0, 0, 0644, libkissfft-float)

	@$(call install_finish, kissfft)

	@$(call touch)

# vim: syntax=make
