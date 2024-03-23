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
PACKAGES-$(PTXCONF_PUGIXML) += pugixml

#
# Paths and names
#
PUGIXML_VERSION		:= 1.14
PUGIXML_MD5		:= bffc9e4d64b1a25a50d39991937a523c
PUGIXML			:= pugixml-$(PUGIXML_VERSION)
PUGIXML_SUFFIX		:= tar.gz
PUGIXML_URL		:= https://github.com/zeux/pugixml/archive/v$(PUGIXML_VERSION).$(PUGIXML_SUFFIX)
PUGIXML_SOURCE		:= $(SRCDIR)/$(PUGIXML).$(PUGIXML_SUFFIX)
PUGIXML_DIR		:= $(BUILDDIR)/$(PUGIXML)
PUGIXML_LICENSE		:= MIT
PUGIXML_LICENSE_FILES	:=

#
# cmake
#
PUGIXML_CONF_TOOL	:= cmake
PUGIXML_CONF_OPT	:= $(CROSS_CMAKE_USR)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/pugixml.targetinstall:
	@$(call targetinfo)

	@$(call install_init, pugixml)
	@$(call install_fixup, pugixml,PRIORITY,optional)
	@$(call install_fixup, pugixml,SECTION,base)
	@$(call install_fixup, pugixml,AUTHOR,"Ladislav Michl <ladis@linux-mips.org>")
	@$(call install_fixup, pugixml,DESCRIPTION,missing)

#	@$(call install_copy, pugixml, 0, 0, 0755, $(PUGIXML_DIR)/foobar, /dev/null)

	@$(call install_finish, pugixml)

	@$(call touch)

# vim: syntax=make
