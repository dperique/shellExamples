#!/bin/bash

# The syntax for default variables always stumps me so let's make
# one here so I can copy/paste because I use this logic a lot.

# The default value is "true".
#
export INTERACTIVE=${INTERACTIVE:="true"}

echo "INTERACTIVE=${INTERACTIVE}"

# If someone already set that variable in their shell (and exported
# it) the value will be that value).
