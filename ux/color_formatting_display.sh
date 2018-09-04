#!/bin/sh

# From: https://misc.flogisoft.com/bash/tip_colors_and_formatting#colors2
# Modified by steve.tarver@gmail.com to work in Alpine Linux ash

# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What The Fuck You Want
# To Public License, Version 2, as published by Sam Hocevar. See
# http://sam.zoy.org/wtfpl/COPYING for more details.

echo 'Printing 256 color background, forground, and style examples'

#Background
for clbg in $(seq 40 47) $(seq 100 107) 49 ; do
	#Foreground
	for clfg in $(seq 30 37) $(seq 90 97) 39 ; do
		#Formatting
		for attr in 0 1 2 4 5 7 ; do
			#Print the result
			printf "\e[${attr};${clbg};${clfg}m ^[${attr};${clbg};${clfg}m \e[0m"
		done
		echo #Newline
	done
done

exit 0
