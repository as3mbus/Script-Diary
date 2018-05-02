#!/bin/bash
fontdir="$(realpath ${1:-$(pwd)})"
fc-cache
xset fp rehash
mkfontscale $fontdir
mkfontdir $fontdir
xset +fp $fontdir # add this to xinitrc
xset fp rehash # with this
fc-cache -fv > /dev/null
echo "
#add this to .xinitrc
### Install font in $fontdir ###
xset +fp $fontdir 
xset fp rehash "
