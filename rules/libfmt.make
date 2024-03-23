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
PACKAGES-$(PTXCONF_LIBFMT) += libfmt

#
# Paths and names
#
LIBFMT_VERSION		:= 10.1.1
LIBFMT_MD5		:= 0d41a16f1b3878d44e6fd7ff1f6cc45a
LIBFMT			:= fmt-$(LIBFMT_VERSION)
LIBFMT_SUFFIX		:= tar.gz
LIBFMT_URL		:= https://github.com/fmtlib/fmt/archive/$(LIBFMT_VERSION).$(LIBFMT_SUFFIX)
LIBFMT_SOURCE		:= $(SRCDIR)/$(LIBFMT).$(LIBFMT_SUFFIX)
LIBFMT_DIR		:= $(BUILDDIR)/$(LIBFMT)
LIBFMT_LICENSE		:= MIT
LIBFMT_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#
# cmake
#
LIBFMT_CONF_TOOL	:= cmake
LIBFMT_CONF_OPT		:= \
	$(CROSS_CMAKE_USR) \
	-DFMT_DOC=OFF \
	-DFMT_TEST=OFF

# vim: syntax=make
