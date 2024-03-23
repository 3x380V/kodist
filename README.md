# KODIst: yet another [KODI](https://kodi.tv/) distribution
> Premiliary release, builds, but no runtime testing done.

## Overview
Implemented as KODI specific [PTXdist](https://www.ptxdist.org/)
layer above [DistroKit](https://git.pengutronix.de/cgit/DistroKit/)
although different base layers can be chosen easily. Whatever hardware
lower layers support is brought here and used, so focus is kept only
on KODI.

## Requirements
You need to have PTXdist and DistroKit installed... obviously.

## Build
Consult [PTXdist User’s Manual](https://www.ptxdist.org/doc/user_manual_section.html)
to get familiar with basic principles. Once these are understood and
[platform selected](https://www.ptxdist.org/doc/user_manual_section.html#selecting-a-hardware-platform)
building an image is as easy as typing
```sh
ptxdist images
```

## License
KODIst is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License, version 2.

Note: KODIst is a pre-configured build system which enables you to
generate a software distribution for embedded systems. KODIst's
license only covers the build system rules in KODIst itself, and
doesn't affect the license of managed software in any way, even if
the managed software might be distributed together with KODIst.
