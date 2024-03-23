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
PACKAGES-$(PTXCONF_TINYXML) += tinyxml

#
# Paths and names
#
TINYXML_VERSION		:= 2_6_2
TINYXML_MD5		:= c1b864c96804a10526540c664ade67f0
TINYXML			:= tinyxml_$(TINYXML_VERSION)
TINYXML_SUFFIX		:= tar.gz
TINYXML_URL		:= $(call ptx/mirror, SF, tinyxml/$(TINYXML).$(TINYXML_SUFFIX))
TINYXML_SOURCE		:= $(SRCDIR)/$(TINYXML).$(TINYXML_SUFFIX)
TINYXML_DIR		:= $(BUILDDIR)/$(TINYXML)
TINYXML_LICENSE		:= ZLIB
TINYXML_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/tinyxml.prepare:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------
$(STATEDIR)/tinyxml.compile:
	@$(call targetinfo)
	@cd $(TINYXML_DIR) && \
		$(CROSS_CXX) -Wno-unknown-pragmas -Wno-format -O3 \
			-DTIXML_USE_STL -c \
			tinyxml.cpp tinyxmlparser.cpp tinyxmlerror.cpp tinystr.cpp
	@cd $(TINYXML_DIR) && \
		$(CROSS_AR) rcs libtinyxml.a \
			tinyxml.o tinyxmlparser.o tinyxmlerror.o tinystr.o
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/tinyxml.install:
	@$(call targetinfo)
	@install -vD -m644 "$(TINYXML_DIR)/tinyxml.h" \
		"$(TINYXML_PKGDIR)/usr/include/tinyxml.h"
	@install -vD -m644 "$(TINYXML_DIR)/libtinyxml.a" \
		"$(TINYXML_PKGDIR)/usr/lib/libtinyxml.a"
	@$(call touch)

# vim: syntax=make
