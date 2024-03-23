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
PACKAGES-$(PTXCONF_FLATBUFFERS) += flatbuffers

#
# Paths and names
#
FLATBUFFERS_VERSION	:= 23.5.26
FLATBUFFERS_MD5		:= 2ef00eaaa86ab5e9ad5eafe09c2e7b60
FLATBUFFERS		:= flatbuffers-$(FLATBUFFERS_VERSION)
FLATBUFFERS_SUFFIX	:= tar.gz
FLATBUFFERS_URL		:= https://github.com/google/flatbuffers/archive/v$(FLATBUFFERS_VERSION).$(FLATBUFFERS_SUFFIX)
FLATBUFFERS_SOURCE	:= $(SRCDIR)/$(FLATBUFFERS).$(FLATBUFFERS_SUFFIX)
FLATBUFFERS_DIR		:= $(BUILDDIR)/$(FLATBUFFERS)
FLATBUFFERS_LICENSE	:= Apache-2.0
FLATBUFFERS_LICENSE_FILES	:=

#
# cmake
#
FLATBUFFERS_CONF_TOOL	:= cmake
FLATBUFFERS_CONF_OPT	:= \
	$(CROSS_CMAKE_USR) \
	-DFLATBUFFERS_BUILD_TESTS=OFF

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/flatbuffers.targetinstall:
	@$(call targetinfo)

	@$(call install_init, flatbuffers)
	@$(call install_fixup, flatbuffers,PRIORITY,optional)
	@$(call install_fixup, flatbuffers,SECTION,base)
	@$(call install_fixup, flatbuffers,AUTHOR,"Ladislav Michl <ladis@linux-mips.org>")
	@$(call install_fixup, flatbuffers,DESCRIPTION,missing)

#	@$(call install_copy, flatbuffers, 0, 0, 0755, $(FLATBUFFERS_DIR)/foobar, /dev/null)

	@$(call install_finish, flatbuffers)

	@$(call touch)

# vim: syntax=make
