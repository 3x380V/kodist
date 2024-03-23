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
PACKAGES-$(PTXCONF_CROSS_APACHE_COMMONS_LANG) += cross-apache-commons-lang

#
# Paths and names
#
CROSS_APACHE_COMMONS_LANG_VERSION    := 3.14.0
CROSS_APACHE_COMMONS_LANG_MD5        := 88c83b3fa007ae35d4f82a2466cad423
CROSS_APACHE_COMMONS_LANG            := commons-lang3-$(CROSS_APACHE_COMMONS_LANG_VERSION)-bin
CROSS_APACHE_COMMONS_LANG_SUFFIX     := tar.gz
CROSS_APACHE_COMMONS_LANG_URL        := https://mirrors.kodi.tv/build-deps/sources/$(CROSS_APACHE_COMMONS_LANG).$(CROSS_APACHE_COMMONS_LANG_SUFFIX)
CROSS_APACHE_COMMONS_LANG_SOURCE     := $(SRCDIR)/$(CROSS_APACHE_COMMONS_LANG).$(CROSS_APACHE_COMMONS_LANG_SUFFIX)

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

$(STATEDIR)/cross-apache-commons-lang.extract:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/cross-apache-commons-lang.prepare:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/cross-apache-commons-lang.compile:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/cross-apache-commons-lang.install:
	@$(call targetinfo)
	@mkdir -p $(CROSS_APACHE_COMMONS_LANG_PKGDIR)/usr/share/java/lang
	@tar --extract --file=$(CROSS_APACHE_COMMONS_LANG_SOURCE) \
		--strip-components=1 \
		--directory=$(CROSS_APACHE_COMMONS_LANG_PKGDIR)/usr/share/java/lang
	@$(call touch)
