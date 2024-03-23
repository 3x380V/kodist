# -*-makefile-*-
#
# Copyright (C) 2024 by Ladislav Michl <ladis@linux-mips.org>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_LIBUDFREAD) += libudfread

#
# Paths and names
#
LIBUDFREAD_VERSION	:= 1.1.2
LIBUDFREAD_MD5		:= 8a05c15bb1b609291f06257060735861
LIBUDFREAD		:= libudfread-$(LIBUDFREAD_VERSION)
LIBUDFREAD_SUFFIX	:= tar.bz2
LIBUDFREAD_URL		:= https://download.videolan.org/pub/videolan/libudfread/$(LIBUDFREAD).$(LIBUDFREAD_SUFFIX) 
LIBUDFREAD_SOURCE	:= $(SRCDIR)/$(LIBUDFREAD).$(LIBUDFREAD_SUFFIX)
LIBUDFREAD_DIR		:= $(BUILDDIR)/$(LIBUDFREAD)
LIBUDFREAD_LICENSE	:= LGPL-2.1-or-later
LIBUDFREAD_LICENSE_FILES	:= \
	file://COPYING;md5=4fbd65380cdd255951079008b364516c

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#
# autoconf
#
LIBUDFREAD_CONF_TOOL	:= autoconf
LIBUDFREAD_CONF_OPT	:= \
	$(CROSS_AUTOCONF_USR) \
	$(GLOBAL_LARGE_FILE_OPTION)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/libudfread.targetinstall:
	@$(call targetinfo)

	@$(call install_init, libudfread)
	@$(call install_fixup, libudfread,PRIORITY,optional)
	@$(call install_fixup, libudfread,SECTION,base)
	@$(call install_fixup, libudfread,AUTHOR,"Ladislav Michl <ladis@linux-mips.org>")
	@$(call install_fixup, libudfread,DESCRIPTION,missing)

	@$(call install_lib, libudfread, 0, 0, 0644, libudfread)

	@$(call install_finish, libudfread)

	@$(call touch)

# vim: syntax=make
