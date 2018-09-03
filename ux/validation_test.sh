#!/bin/sh -e
#
# I test validation.sh functions
#
# USE:
#   ./validation_test.sh
#
# NOTES:
#
#
# EXAMPLES:
#
#
# EXIT CODES:
#   None
#
# CAVEATS:
#   None
#

# Print a green 'Pass'
pass() {
    stderr "$(green 'Pass'): ${1} = ${2}"
}

# Print a red 'Fail'
fail() {
    stderr "$(red 'Fail'): ${1} = ${2}"
}

# Report predicates = true (0)
should_be_true() {
    # predicate | if true        | if false
    eval ${1}  && pass 'true ' "${1}" || fail 'false' "${1}"
}

# Report predicates = false (1)
should_be_false() {
    # predicate | if true        | if false
    eval ${1}  && fail 'true ' "${1}" || pass 'false' "${1}"
}

THIS_SCRIPT_DIR=$(dirname $(readlink -f "${0}"))
(
    cd ${THIS_SCRIPT_DIR}
    source validation.sh
    source colors.sh

    # TODO: consider a data driven approach - difficult with empty arg tests...
    stderr "$(bg_black $(white '===== is_int tests ==============='))"
    should_be_true 'is_int 1'
    should_be_true 'is_int "1"'
    should_be_true 'is_int +123'
    should_be_true 'is_int -123'
    should_be_true 'is_int "-123"'

    should_be_false 'is_int   '
    should_be_false 'is_int a'
    should_be_false 'is_int -1a'
    should_be_false 'is_int "-1a"'
    should_be_false 'is_int "a1"'
    should_be_false 'is_int +243!'

    stderr "$(bg_black $(white '===== is_pos_int tests ==========='))"
    should_be_true 'is_pos_int 1'
    should_be_true 'is_pos_int 123'
    should_be_true 'is_pos_int +123'

    should_be_false 'is_pos_int -1'
    should_be_false 'is_pos_int -123'
    should_be_false 'is_pos_int "-123"'
    should_be_false 'is_pos_int a'
    should_be_false 'is_pos_int abc'

    stderr "$(bg_black $(white '===== is_neg_int tests ==========='))"
    should_be_true 'is_neg_int -1'
    should_be_true 'is_neg_int -123'

    should_be_false 'is_neg_int 1'
    should_be_false 'is_neg_int +123'
    should_be_false 'is_neg_int "+123"'
    should_be_false 'is_neg_int a'
    should_be_false 'is_neg_int abc'

    stderr "$(bg_black $(white '===== is_empty tests ============='))"
    should_be_true 'is_empty   '
    should_be_true 'is_empty ""'

    should_be_false 'is_empty "  "'
    should_be_false 'is_empty a'
    should_be_false 'is_empty "a"'
    should_be_false 'is_empty "abc"'
    should_be_false 'is_empty 123'
    should_be_false 'is_empty $'

    stderr "$(bg_black $(white '===== is_blank tests ============='))"
    should_be_true 'is_blank   '
    should_be_true 'is_blank ""'
    should_be_true 'is_blank " "'

    should_be_false 'is_blank a'
    should_be_false 'is_blank "a"'
    should_be_false 'is_blank "abc"'
    should_be_false 'is_blank 123'
    should_be_false 'is_blank ^'

    stderr "$(bg_black $(white '===== is_not_empty tests ========='))"
    should_be_true 'is_not_empty "   "'
    should_be_true 'is_not_empty a'
    should_be_true 'is_not_empty "a"'
    should_be_true 'is_not_empty abc'
    should_be_true 'is_not_empty "abc"'
    should_be_true 'is_not_empty 123'
    should_be_true 'is_not_empty "123"'

    should_be_false 'is_not_empty   '
    should_be_false 'is_not_empty ""'

    stderr "$(bg_black $(white '===== is_not_blank tests ========='))"
    should_be_true 'is_not_blank a'
    should_be_true 'is_not_blank "a"'
    should_be_true 'is_not_blank abc'
    should_be_true 'is_not_blank "abc"'
    should_be_true 'is_not_blank 123'
    should_be_true 'is_not_blank "123"'
    should_be_true 'is_not_blank +'

    should_be_false 'is_not_blank '
    should_be_false 'is_not_blank ""'
    should_be_false 'is_not_blank "      "'

    stderr "$(bg_black $(white '===== is_not_blank tests ========='))"
    ENUM='one two three'
    should_be_true 'is_enum one   "${ENUM}"'
    should_be_true 'is_enum two   "${ENUM}"'
    should_be_true 'is_enum "two" "${ENUM}"'
    should_be_true 'is_enum three  ${ENUM}'

    should_be_false 'is_enum thre   ${ENUM}'
    should_be_false 'is_enum ne    "${ENUM}"'
    should_be_false 'is_enum " "    ${ENUM}'
    should_be_false 'is_enum ""     ${ENUM}'
    should_be_false 'is_enum        ${ENUM}'


)

