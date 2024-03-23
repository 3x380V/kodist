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
PACKAGES-$(PTXCONF_LIBSPDLOG) += libspdlog

#
# Paths and names
#
LIBSPDLOG_VERSION	:= 1.12.0
LIBSPDLOG_MD5		:= 6b4446526264c1d1276105482adc18d1
LIBSPDLOG		:= spdlog-$(LIBSPDLOG_VERSION)
LIBSPDLOG_SUFFIX	:= tar.gz
LIBSPDLOG_URL		:= https://github.com/gabime/spdlog/archive/v$(LIBSPDLOG_VERSION).$(LIBSPDLOG_SUFFIX)
LIBSPDLOG_SOURCE	:= $(SRCDIR)/$(LIBSPDLOG).$(LIBSPDLOG_SUFFIX)
LIBSPDLOG_DIR		:= $(BUILDDIR)/$(LIBSPDLOG)
LIBSPDLOG_LICENSE	:= MIT
LIBSPDLOG_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#
# cmake
#
LIBSPDLOG_CONF_TOOL	:= cmake
LIBSPDLOG_CONF_OPT	:= \
	$(CROSS_CMAKE_USR) \
	-DSPDLOG_BUILD_EXAMPLE=OFF \
	-DSPDLOG_FMT_EXTERNAL=ON

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/libspdlog.targetinstall:
	@$(call targetinfo)

	@$(call install_init, libspdlog)
	@$(call install_fixup, libspdlog,PRIORITY,optional)
	@$(call install_fixup, libspdlog,SECTION,base)
	@$(call install_fixup, libspdlog,AUTHOR,"Ladislav Michl <ladis@linux-mips.org>")
	@$(call install_fixup, libspdlog,DESCRIPTION,missing)

#	@$(call install_copy, libspdlog, 0, 0, 0755, $(LIBSPDLOG_DIR)/foobar, /dev/null)

	@$(call install_finish, libspdlog)

	@$(call touch)

# vim: syntax=make
