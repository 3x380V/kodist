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
PACKAGES-$(PTXCONF_CROSS_GROOVY) += cross-groovy

#
# Paths and names
#
CROSS_GROOVY_VERSION    := 4.0.16
CROSS_GROOVY_MD5        := bd9eb761a11372dd659da8c2cf1ae692
CROSS_GROOVY            := apache-groovy-binary-$(CROSS_GROOVY_VERSION)
CROSS_GROOVY_SUFFIX     := zip
CROSS_GROOVY_URL        := https://mirrors.kodi.tv/build-deps/sources/$(CROSS_GROOVY).$(CROSS_GROOVY_SUFFIX)
CROSS_GROOVY_SOURCE     := $(SRCDIR)/$(CROSS_GROOVY).$(CROSS_GROOVY_SUFFIX)

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

$(STATEDIR)/cross-groovy.extract:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/cross-groovy.prepare:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/cross-groovy.compile:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/cross-groovy.install:
	@$(call targetinfo)
	@mkdir -p $(CROSS_GROOVY_PKGDIR)/usr/share
	@unzip $(CROSS_GROOVY_SOURCE) -d $(CROSS_GROOVY_PKGDIR)/usr/share
	@mv $(CROSS_GROOVY_PKGDIR)/usr/share/groovy-$(CROSS_GROOVY_VERSION) \
		$(CROSS_GROOVY_PKGDIR)/usr/share/groovy
	@$(call touch)
