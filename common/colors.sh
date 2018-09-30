#!/bin/sh -e
##############################################################
#  Copyright (c) 2018 Steve Tarver. All rights reserved.     #
#                                                            #
#  This work is licensed under the terms of the MIT license. #
#  For a copy, see <https://opensource.org/licenses/MIT>.    #
##############################################################
#
# Color terminal printing support
#
# USE:
#   source colors.sh
#   stderr "$(red 'I am red')"
#
# NOTES:
# - We don't include color codes when printing to a device that does not support them.
# - Functions with a '_' prefix are not meant for external use.
# - See 'colors_test.sh' for more examples.
#
# EXAMPLES:
#   # Print the entire line, in red, to stderr:
#   stderr $(red "Error processing, cannot continue. Code: ${CODE}")
#
#   # Print the entire line, in red, with parts in bold, to stderr:
#   stderr $(red "Error processing, $(bold 'cannot continue'). Code: ${CODE}")
#
#   # Print part of the line in red, part in yellow:
#   stderr "$(red 'Error processing, cannot continue.') $(yellow "Code: ${CODE}")"
#
#   Review and / or run colors_test.sh for more examples
#
# RATIONALE:
#   Goals:
#   - print control codes to format color and style
#   - ONLY include color codes if the output device supports it
#
#   Conditional coloring coding (omitting codes when the device does not support them) requires
#   Using functions in this file. Supporting multiple output devices greatly complicates code
#   in this file, as well as client's.
#
#   Information and errors should be sent to stderr so your script can be automated;
#   people can call your script from other scripts and easily parse stdout.
#
# REFERENCES:
# - https://misc.flogisoft.com/bash/tip_colors_and_formatting
# - nested functions and isolation: https://www.linuxjournal.com/content/return-values-bash-functions
# - ECMA escape codes, see SGR - SELECT GRAPHIC RENDITION
#   https://www.ecma-international.org/publications/files/ECMA-ST/Ecma-048.pdf
#
# EXIT CODES:
#   None
#
# CAVEATS:
# - These functions require you to use the included printing functions. Otherwise
#   we cannot tell if stderr has been redirected and does not support color.
# - By wary of this script polluting your global namespace.
#
theme_default() {
    _FG_BLACK='\033[30m'
    _FG_RED='\033[31m'
    _FG_GREEN='\033[32m'
    _FG_YELLOW='\033[33m'
    _FG_BLUE='\033[34m'
    _FG_MAGENTA='\033[35m'
    _FG_CYAN='\033[36m'
    _FG_LIGHT_GRAY='\033[37m'
    _FG_DEFAULT='\033[39m'
    _FG_DARK_GRAY='\033[90m'
    _FG_LIGHT_RED='\033[91m'
    _FG_LIGHT_GREEN='\033[92m'
    _FG_LIGHT_YELLOW='\033[93m'
    _FG_LIGHT_BLUE='\033[94m'
    _FG_LIGHT_MAGENTA='\033[95m'
    _FG_LIGHT_CYAN='\033[96m'
    _FG_WHITE='\033[97m'

    _BG_BLACK='\033[40m'
    _BG_RED='\033[41m'
    _BG_GREEN='\033[42m'
    _BG_YELLOW='\033[43m'
    _BG_BLUE='\033[44m'
    _BG_MAGENTA='\033[45m'
    _BG_CYAN='\033[46m'
    _BG_LIGHT_GRAY='\033[47m'
    _BG_DEFAULT='\033[49m'
    _BG_DARK_GRAY='\033[100m'
    _BG_LIGHT_RED='\033[101m'
    _BG_LIGHT_GREEN='\033[102m'
    _BG_LIGHT_YELLOW='\033[103m'
    _BG_LIGHT_BLUE='\033[104m'
    _BG_LIGHT_MAGENTA='\033[105m'
    _BG_LIGHT_CYAN='\033[106m'
    _BG_WHITE='\033[107m'

    _STYLE_BOLD='\033[1m'
    _STYLE_DIM='\033[2m'
    _STYLE_ITALICS='\033[3m'
    _STYLE_UNDERLINE='\033[4m'
    _STYLE_REVERSE='\033[7m'

    _RESET_BOLD='\033[22m'
    _RESET_DIM='\033[22m'
    _RESET_ITALICS='\033[23m'
    _RESET_UNDERLINE='\033[24m'
    _RESET_REVERSE='\033[27m'

    # Put this at the end of every line
    _RESET_ALL='\033[0m'
}

# Set our color scheme
theme_default

# Print all args to stderr
# All informational/error messages should use stderr to separate
# them from data output.
# Reset all colors / styles at EOL for good measure.
stderr() {
    if [ -t 2 ]; then
        printf "%b\\n" "${@}${_RESET_ALL}" >&2
    else
        printf "%s\\n" "${@}" >&2
    fi
}

# Wrap all args with color / style code and reset.
# This function simplifies changing color/style on a single line, without printing the newline
# ${1} : color / style code
# ${2} : reset code
# rest : text
_colorize() {
    local C="${1}"
    local R="${2}"
    shift 2
    local TEXT="${@}"
    if [ -t 2 ]; then
        printf "%b" "${C}${TEXT}${R}"
    else
        printf "%s" "${TEXT}"
    fi
}

#########################################################################################
# Foreground color functions:
# All functions apply the color to ${@} and reset color at end of string.
# NOTE: we use ${@} so you can have multiple args, each with different coloring
black() {
    _colorize ${_FG_BLACK} ${_RESET_ALL} "${@}"
}
dark_gray() {
    _colorize ${_FG_DARK_GRAY} ${_RESET_ALL} "${@}"
}
default() {
    _colorize ${_FG_DEFAULT} ${_RESET_ALL}  "${@}"
}
white() {
    _colorize ${_FG_WHITE} ${_RESET_ALL} "${@}"
}
light_gray() {
    _colorize ${_FG_LIGHT_GRAY} ${_RESET_ALL} "${@}"
}
red() {
    _colorize ${_FG_RED} ${_RESET_ALL} "${@}"
}
light_red() {
    _colorize ${_FG_LIGHT_RED} ${_RESET_ALL} "${@}"
}
yellow() {
    _colorize ${_FG_YELLOW} ${_RESET_ALL} "${@}"
}
light_yellow() {
    _colorize ${_FG_LIGHT_YELLOW} ${_RESET_ALL} "${@}"
}
green() {
    _colorize ${_FG_GREEN} ${_RESET_ALL} "${@}"
}
light_green() {
    _colorize ${_FG_LIGHT_GREEN} ${_RESET_ALL} "${@}"
}
cyan() {
    _colorize ${_FG_CYAN} ${_RESET_ALL} "${@}"
}
light_cyan() {
    _colorize ${_FG_LIGHT_CYAN} ${_RESET_ALL} "${@}"
}
blue() {
    _colorize ${_FG_BLUE} ${_RESET_ALL} "${@}"
}
light_blue() {
    _colorize ${_FG_LIGHT_BLUE} ${_RESET_ALL} "${@}"
}
magenta() {
    _colorize ${_FG_MAGENTA} ${_RESET_ALL} "${@}"
}
light_magenta() {
    _colorize ${_FG_LIGHT_MAGENTA} ${_RESET_ALL} "${@}"
}


#########################################################################################
# Background color functions:
bg_black() {
    _colorize ${_BG_BLACK} ${_RESET_ALL} "${@}"
}
bg_dark_gray() {
    _colorize ${_BG_DARK_GRAY} ${_RESET_ALL} "${@}"
}
bg_default() {
    _colorize ${_BG_DEFAULT} ${_RESET_ALL}  "${@}"
}
bg_white() {
    _colorize ${_BG_WHITE} ${_RESET_ALL} "${@}"
}
bg_light_gray() {
    _colorize ${_BG_LIGHT_GRAY} ${_RESET_ALL} "${@}"
}
bg_red() {
    _colorize ${_BG_RED} ${_RESET_ALL} "${@}"
}
bg_light_red() {
    _colorize ${_BG_LIGHT_RED} ${_RESET_ALL} "${@}"
}
bg_yellow() {
    _colorize ${_BG_YELLOW} ${_RESET_ALL} "${@}"
}
bg_light_yellow() {
    _colorize ${_BG_LIGHT_YELLOW} ${_RESET_ALL} "${@}"
}
bg_green() {
    _colorize ${_BG_GREEN} ${_RESET_ALL} "${@}"
}
bg_light_green() {
    _colorize ${_BG_LIGHT_GREEN} ${_RESET_ALL} "${@}"
}
bg_cyan() {
    _colorize ${_BG_CYAN} ${_RESET_ALL} "${@}"
}
bg_light_cyan() {
    _colorize ${_BG_LIGHT_CYAN} ${_RESET_ALL} "${@}"
}
bg_blue() {
    _colorize ${_BG_BLUE} ${_RESET_ALL} "${@}"
}
bg_light_blue() {
    _colorize ${_BG_LIGHT_BLUE} ${_RESET_ALL} "${@}"
}
bg_magenta() {
    _colorize ${_BG_MAGENTA} ${_RESET_ALL} "${@}"
}
bg_light_magenta() {
    _colorize ${_BG_LIGHT_MAGENTA} ${_RESET_ALL} "${@}"
}

#########################################################################################
# Style functions
bold() {
    _colorize ${_STYLE_BOLD} ${_RESET_BOLD} "${@}"
}
dim() {
    _colorize ${_STYLE_DIM} ${_RESET_DIM} "${@}"
}
underline() {
    _colorize ${_STYLE_UNDERLINE} ${_RESET_UNDERLINE} "${@}"
}
italics() {
    _colorize ${_STYLE_ITALICS} ${_RESET_ITALICS} "${@}"
}
reverse() {
    _colorize ${_STYLE_REVERSE} ${_RESET_REVERSE} "${@}"
}
