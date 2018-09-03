#!/bin/sh -e
#
# A test script for colors.sh
#
#
# USE:
#   ./colors_test.sh
#
# NOTES:
#
#
# EXAMPLES:
#
#
# EXIT CODES:
#
#
# CAVEATS:
#

# Print foreground colors and styles
show_fg_colors() {
    stderr "This fg color is $(black         'XXXX BLACK         ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This fg color is $(dark_gray     'XXXX DARK GRAY     ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This fg color is $(default       'XXXX DEFAULT       ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This fg color is $(light_gray    'XXXX LIGHT GRAY    ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This fg color is $(white         'XXXX WHITE         ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This fg color is $(red           'XXXX RED           ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This fg color is $(light_red     'XXXX LIGHT RED     ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This fg color is $(yellow        'XXXX YELLOW        ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This fg color is $(light_yellow  'XXXX LIGHT YELLOW  ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This fg color is $(green         'XXXX GREEN         ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This fg color is $(light_green   'XXXX LIGHT GREEN   ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This fg color is $(cyan          'XXXX CYAN          ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This fg color is $(light_cyan    'XXXX LIGHT CYAN    ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This fg color is $(blue          'XXXX BLUE          ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This fg color is $(light_blue    'XXXX LIGHT BLUE    ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This fg color is $(magenta       'XXXX MAGENTA       ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This fg color is $(light_magenta 'XXXX LIGHT MAGENTA ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
}

# Print background colors and styles
show_bg_colors() {
    stderr "This bg color is $(bg_black         'XXXX BLACK         ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This bg color is $(bg_dark_gray     'XXXX DARK GRAY     ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This bg color is $(bg_default       'XXXX DEFAULT       ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This bg color is $(bg_light_gray    'XXXX LIGHT GRAY    ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This bg color is $(bg_white         'XXXX WHITE         ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This bg color is $(bg_red           'XXXX RED           ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This bg color is $(bg_light_red     'XXXX LIGHT RED     ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This bg color is $(bg_yellow        'XXXX YELLOW        ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This bg color is $(bg_light_yellow  'XXXX LIGHT YELLOW  ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This bg color is $(bg_green         'XXXX GREEN         ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This bg color is $(bg_light_green   'XXXX LIGHT GREEN   ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This bg color is $(bg_cyan          'XXXX CYAN          ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This bg color is $(bg_light_cyan    'XXXX LIGHT CYAN    ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This bg color is $(bg_blue          'XXXX BLUE          ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This bg color is $(bg_light_blue    'XXXX LIGHT BLUE    ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This bg color is $(bg_magenta       'XXXX MAGENTA       ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
    stderr "This bg color is $(bg_light_magenta 'XXXX LIGHT MAGENTA ' $(bold 'BOLD') ' ' $(dim 'DIM') ' ' $(italics 'ITALICS') ' ' $(underline 'UNDERLINE') ' ' $(reverse 'REVERSE')  )"
}

#THIS_SCRIPT_DIR=$(dirname $(readlink -f "${0}"))
(
#    cd ${THIS_SCRIPT_DIR}
    source colors.sh

    stderr 'Examples of foreground colors and styles'
    show_fg_colors

    stderr
    stderr 'Examples of background colors and styles'
    show_bg_colors

    stderr
    # Use examples
    stderr 'Multiple styles with a single color in one line:'
    stderr "    $(red $(bold 'Red BOLD') and then some $(italics 'italics') or $(reverse 'reversed text') within one red line.)"
    stderr '    $(red $(bold '\''Red BOLD'\'') and then some $(italics '\''italics'\'') or $(reverse '\''reversed text'\'') within one red line.)'
    stderr '  Note that the style functions are within the '\''red()'\'' function.'

    stderr
    stderr 'Multiple styles for a single phrase within a line:'
    stderr "    $(red $(bold $(italics $(underline 'Underlined red BOLD italics'))) within one red line.)"
    stderr '    $(red $(bold $(italics $(underline '\''Underlined red BOLD italics'\''))) within one red line.)'
    stderr '  The style order doesn'\''t make a difference.'

    stderr
    stderr 'Multiple colors in a line:'
    stderr "    $(red $(bold 'Red BOLD')) and some $(green $(italics 'Green italics')) within one line."
    stderr '    $(red $(bold '\''Red BOLD'\'')) and some $(green $(italics '\''Green italics'\'')) within one line.'
    stderr '  Note that we are tightly scoping the color functions to the target text.'
    stderr
    stderr '  Trying to set green text within a red line, as with styles will not work:'
    stderr "    $(red $(bold 'Red BOLD') and some $(green $(italics 'Green italics')) within one line.)"
    stderr '    $(red $(bold '\''Red BOLD'\'') and some $(green $(italics '\''Green italics'\'')) within one line.)'
    stderr '  Each color function sets the color till the closing '\'')'\''. The green close paren resets all foreground colors.'

    stderr
    stderr 'Reverse text for a single word in a line'
    stderr "    This word must be very important: $(red $(reverse 'important!'))"
    stderr '    This word must be very important: $(red $(reverse '\''important!'\''))'
    stderr '  A similar effect is possible with background colors but gives more control:'
    stderr "    This word must be very important: $(bg_red $(white 'important!'))"
    stderr '    This word must be very important: $(bg_red $(white '\''important!'\''))'

    stderr
    stderr 'Here-docs to cat can be colored as well:'
cat <<EOT >&2
    $(red $(bold 'Red BOLD') and then some $(italics 'italics') or $(reverse 'reversed text') within one red line.)
EOT
    stderr '    cat <<EOT >&2'
    stderr '        $(red $(bold '\''Red BOLD'\'') and then some $(italics '\''italics'\'') or $(reverse '\''reversed text'\'') within one red line.)'
    stderr '    EOT'
    stderr '  Note that we are sending the heredoc to cat, but redirecting that to stderr.'
    stderr '  CAVEAT: colors.sh only checks if stderr supports color; that is the only place we intend to print color.'
    stderr '  You can see that all color codes are removed from stderr devices that do not support color with:'
    stderr '    ./colors_test.sh 2>error.txt'

    stderr

)
