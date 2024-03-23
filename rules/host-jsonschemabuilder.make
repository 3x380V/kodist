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
HOST_PACKAGES-$(PTXCONF_HOST_JSONSCHEMABUILDER) += host-jsonschemabuilder

HOST_JSONSCHEMABUILDER_VERSION	 = $(HOST_KODI_VERSION)
HOST_JSONSCHEMABUILDER_DIR	 = $(HOST_KODI_DIR)
HOST_JSONSCHEMABUILDER_SUBDIR	:= tools/depends/native/JsonSchemaBuilder/src

#
# cmake
#
HOST_JSONSCHEMABUILDER_CONF_TOOL	:= cmake
HOST_JSONSCHEMABUILDER_BUILD_DIR	 = $(HOST_JSONSCHEMABUILDER_DIR)-JsonSchemaBuilder-build
HOST_JSONSCHEMABUILDER_CONF_OPT		 = \
	$(HOST_CMAKE_OPT) \
	-B$(HOST_JSONSCHEMABUILDER_BUILD_DIR)
HOST_JSONSCHEMABUILDER_INSTALL_OPT	:= \
	install \
	DESTDIR=$(PTXDIST_SYSROOT_HOST)
