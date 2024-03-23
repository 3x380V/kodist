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
PACKAGES-$(PTXCONF_TINYXML2) += tinyxml2

#
# Paths and names
#
TINYXML2_VERSION	:= 9.0.0
TINYXML2_MD5		:= afecd941107a8e74d3d1b4363cf52bd7
TINYXML2		:= tinyxml2-$(TINYXML2_VERSION)
TINYXML2_SUFFIX		:= tar.gz
TINYXML2_URL		:= https://github.com/leethomason/tinyxml2/archive/$(TINYXML2_VERSION).$(TINYXML2_SUFFIX)
TINYXML2_SOURCE		:= $(SRCDIR)/$(TINYXML2).$(TINYXML2_SUFFIX)
TINYXML2_DIR		:= $(BUILDDIR)/$(TINYXML2)
TINYXML2_LICENSE	:= ZLIB
TINYXML2_LICENSE_FILES	:= \
	file://LICENSE.txt;md5=135624eef03e1f1101b9ba9ac9b5fffd

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#
# cmake
#
TINYXML2_CONF_TOOL	:= cmake
TINYXML2_CONF_OPT	:= \
	$(CROSS_CMAKE_USR) \
	-Dtinyxml2_SHARED_LIBS=ON \
	-Dtinyxml2_BUILD_TESTING=OFF

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/tinyxml2.targetinstall:
	@$(call targetinfo)

	@$(call install_init, tinyxml2)
	@$(call install_fixup, tinyxml2,PRIORITY,optional)
	@$(call install_fixup, tinyxml2,SECTION,base)
	@$(call install_fixup, tinyxml2,AUTHOR,"Ladislav Michl <ladis@linux-mips.org>")
	@$(call install_fixup, tinyxml2,DESCRIPTION,missing)

	@$(call install_lib, tinyxml2, 0, 0, 0644, libtinyxml2)

	@$(call install_finish, tinyxml2)

	@$(call touch)

# vim: syntax=make
