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
PACKAGES-$(PTXCONF_CROSSGUID) += crossguid

#
# Paths and names
#
CROSSGUID_VERSION	:= ca1bf4b
CROSSGUID_MD5		:= d4a8d62f3f8d6d946be75cf5bfa92687
CROSSGUID		:= crossguid-$(CROSSGUID_VERSION)
CROSSGUID_SUFFIX	:= tar.gz
CROSSGUID_URL		:= https://github.com/graeme-hill/crossguid/archive/$(CROSSGUID_VERSION).$(CROSSGUID_SUFFIX)
CROSSGUID_SOURCE	:= $(SRCDIR)/$(CROSSGUID).$(CROSSGUID_SUFFIX)
CROSSGUID_DIR		:= $(BUILDDIR)/$(CROSSGUID)
CROSSGUID_LICENSE	:= MIT
CROSSGUID_LICENSE_FILES	:=

#
# cmake
#
CROSSGUID_CONF_TOOL	:= cmake
CROSSGUID_CONF_OPT	:= \
	$(CROSS_CMAKE_USR) \
	-DCROSSGUID_TESTS=OFF

# vim: syntax=make
