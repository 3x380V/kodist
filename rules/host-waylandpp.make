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
HOST_PACKAGES-$(PTXCONF_HOST_WAYLANDPP) += host-waylandpp

#
# cmake
#
HOST_WAYLANDPP_CONF_TOOL	:= cmake
HOST_WAYLANDPP_CONF_OPT		:= \
	$(HOST_CMAKE_OPT) \
	-DBUILD_SERVER=OFF \
	-DBUILD_LIBRARIES=OFF \
	-DBUILD_SCANNER=ON \
	-DBUILD_DOCUMENTATION=OFF \
	-DBUILD_EXAMPLES=OFF
