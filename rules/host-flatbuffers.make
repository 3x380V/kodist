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
HOST_PACKAGES-$(PTXCONF_HOST_FLATBUFFERS) += host-flatbuffers

#
# cmake
#
HOST_FLATBUFFERS_CONF_TOOL	:= cmake
HOST_FLATBUFFERS_CONF_OPT	:= \
	$(HOST_CMAKE_OPT) \
	-DFLATBUFFERS_BUILD_TESTS=OFF \
	-DFLATBUFFERS_BUILD_FLATLIB=OFF
