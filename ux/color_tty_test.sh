#!/bin/sh

# From: https://misc.flogisoft.com/bash/tip_colors_and_formatting#colors2
# Modified by steve.tarver@gmail.com to work in Alpine Linux ash

# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What The Fuck You Want
# To Public License, Version 2, as published by Sam Hocevar. See
# http://sam.zoy.org/wtfpl/COPYING for more details.

echo 'Printing 256 foreground and background colors:'

for fgbg in 38 48 ; do # Foreground / Background
    for color in $(seq 0 255) ; do # Colors
        # Display the color
        printf "\e[${fgbg};5;%sm  %3s  \e[0m" $color $color
        # Display 6 colors per lines
        if [ $(( ($color + 1) % 6)) == 4 ] ; then
            echo # New line
        fi
    done
    echo # New line
done

exit 0
