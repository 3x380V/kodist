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
PACKAGES-$(PTXCONF_WAYLANDPP) += waylandpp

#
# Paths and names
#
WAYLANDPP_VERSION	:= 1.0.0
WAYLANDPP_MD5		:= 2b0892152599210e9797a0651a119f65
WAYLANDPP		:= waylandpp-$(WAYLANDPP_VERSION)
WAYLANDPP_SUFFIX	:= tar.gz
WAYLANDPP_URL		:= https://github.com/NilsBrause/waylandpp/archive/$(WAYLANDPP_VERSION).$(WAYLANDPP_SUFFIX)
WAYLANDPP_SOURCE	:= $(SRCDIR)/$(WAYLANDPP).$(WAYLANDPP_SUFFIX)
WAYLANDPP_DIR		:= $(BUILDDIR)/$(WAYLANDPP)
WAYLANDPP_LICENSE	:= MIT
WAYLANDPP_LICENSE_FILES	:=

#
# cmake
#
WAYLANDPP_CONF_TOOL	:= cmake
WAYLANDPP_CONF_OPT	:= \
	$(CROSS_CMAKE_USR) \
	-DBUILD_SCANNER=OFF \
	-DBUILD_DOCUMENTATION=OFF \
	-DBUILD_EXAMPLES=OFF \
	-DWAYLAND_SCANNERPP=$(PTXDIST_SYSROOT_HOST)/usr/bin/wayland-scanner++

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/waylandpp.targetinstall:
	@$(call targetinfo)

	@$(call install_init, waylandpp)
	@$(call install_fixup, waylandpp, PRIORITY, optional)
	@$(call install_fixup, waylandpp, SECTION, base)
	@$(call install_fixup, waylandpp, AUTHOR, "Ladislav Michl <ladis@linux-mips.org>")
	@$(call install_fixup, waylandpp, DESCRIPTION, missing)

	@$(foreach lib, libwayland-client-extra++ libwayland-client++ \
			libwayland-client-unstable++ libwayland-egl++ \
			libwayland-server-extra++ libwayland-server++ \
			libwayland-server-unstable++, \
		$(call install_lib, waylandpp, 0, 0, 0644, $(lib))$(ptx/nl))

	@$(call install_finish, waylandpp)

	@$(call touch)

# vim: syntax=make
