#!/bin/sh -e
#
# Show function basics
#

# Print a hello with args
hello() {
    echo "hello: you provided: arg1='${1}', arg2='${2}', all='${@}'"
}

# A simple call to 'hello' will print to stdout
hello
# prints: "hello: you provided: arg1='', arg2='', all=''"

# We can pass args and you can access them through ${@}, ${1}, etc.
hello ken thompson
# prints: "hello: you provided: arg1='ken', arg2='thompson', all='ken thompson'"

# We can capture that output and return code
HELLO=$(hello ken thompson)
HELLO_RETURN_CODE=${?}

# Nothing is printed to stdout - we'll do that
echo "This is the output: ${HELLO}"
# prints: "This is the output: hello: you provided: arg1='ken', arg2='thompson', all='ken thompson'"
echo "The return code is: ${?}, because 'echo' succeeded."
# prints: "The return code is: 0, because 'echo' succeeded."

