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
PACKAGES-$(PTXCONF_CROSS_APACHE_COMMONS_TEXT) += cross-apache-commons-text

#
# Paths and names
#
CROSS_APACHE_COMMONS_TEXT_VERSION    := 1.11.0
CROSS_APACHE_COMMONS_TEXT_MD5        := ae1f7607159b192e12f9c8eaaaf3d927
CROSS_APACHE_COMMONS_TEXT            := commons-text-$(CROSS_APACHE_COMMONS_TEXT_VERSION)-bin
CROSS_APACHE_COMMONS_TEXT_SUFFIX     := tar.gz
CROSS_APACHE_COMMONS_TEXT_URL        := https://mirrors.kodi.tv/build-deps/sources/$(CROSS_APACHE_COMMONS_TEXT).$(CROSS_APACHE_COMMONS_TEXT_SUFFIX)
CROSS_APACHE_COMMONS_TEXT_SOURCE     := $(SRCDIR)/$(CROSS_APACHE_COMMONS_TEXT).$(CROSS_APACHE_COMMONS_TEXT_SUFFIX)

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

$(STATEDIR)/cross-apache-commons-text.extract:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/cross-apache-commons-text.prepare:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/cross-apache-commons-text.compile:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/cross-apache-commons-text.install:
	@$(call targetinfo)
	@mkdir -p $(CROSS_APACHE_COMMONS_TEXT_PKGDIR)/usr/share/java/text
	@tar --extract --file=$(CROSS_APACHE_COMMONS_TEXT_SOURCE) \
		--strip-components=1 \
		--directory=$(CROSS_APACHE_COMMONS_TEXT_PKGDIR)/usr/share/java/text
	@$(call touch)
