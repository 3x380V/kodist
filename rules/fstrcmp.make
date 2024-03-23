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
PACKAGES-$(PTXCONF_FSTRCMP) += fstrcmp

#
# Paths and names
#
FSTRCMP_VERSION		:= 0.7.D001
FSTRCMP_MD5		:= 9c440bbdfcad9fd22e38f2388715b0cc
FSTRCMP			:= fstrcmp-$(FSTRCMP_VERSION)
FSTRCMP_SUFFIX		:= tar.gz
FSTRCMP_URL		:= $(call ptx/mirror, SF, fstrcmp/$(FSTRCMP).$(FSTRCMP_SUFFIX))
FSTRCMP_SOURCE		:= $(SRCDIR)/$(FSTRCMP).$(FSTRCMP_SUFFIX)
FSTRCMP_DIR		:= $(BUILDDIR)/$(FSTRCMP)
FSTRCMP_LICENSE		:= GPL-3.0-or-later AND LGPL-3.0-or-later
FSTRCMP_LICENSE_FILES	:= \
	file://LICENSE;md5=84269fe9822f573d2cc8131b63febc57

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#
# autoconf
#
FSTRCMP_CONF_TOOL	:= autoconf
FSTRCMP_CONF_OPT	:= \
	$(CROSS_AUTOCONF_USR)
FSTRCMP_CONF_ENV	:= \
	$(CROSS_ENV) \
        ac_cv_prog_GROFF=no \
	ac_cv_prog_MANPATH_PROG=no

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

FSTRCMP_MAKE_OPT	:= all-bin

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

FSTRCMP_INSTALL_OPT	:= install-bin install-include libdir/pkgconfig/fstrcmp.pc

$(STATEDIR)/fstrcmp.install:
	@$(call targetinfo)

	@$(call world/install, FSTRCMP)

	# install-libdir is trying to install a .lai file which is missing
	# because of rpath removal, so do a manual install here
	@install -vD -m 755 $(FSTRCMP_DIR)/lib/.libs/libfstrcmp.a \
                $(FSTRCMP_PKGDIR)/usr/lib/libfstrcmp.a
	@install -vD -m 755 $(FSTRCMP_DIR)/lib/libfstrcmp.la \
		$(FSTRCMP_PKGDIR)/usr/lib/libfstrcmp.la
	@install -vD -m 755 $(FSTRCMP_DIR)/libdir/pkgconfig/fstrcmp.pc \
		$(FSTRCMP_PKGDIR)/usr/lib/pkgconfig/fstrcmp.pc

	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/fstrcmp.targetinstall:
	@$(call targetinfo)

	@$(call install_init, fstrcmp)
	@$(call install_fixup, fstrcmp, PRIORITY, optional)
	@$(call install_fixup, fstrcmp, SECTION, base)
	@$(call install_fixup, fstrcmp, AUTHOR, "Ladislav Michl <ladis@linux-mips.org>")
	@$(call install_fixup, fstrcmp, DESCRIPTION, missing)

	@$(call install_copy, fstrcmp, 0, 0, 0755, -, /usr/bin/fstrcmp)

	@$(call install_finish, fstrcmp)

	@$(call touch)

# vim: syntax=make
