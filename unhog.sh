#!/bin/bash

# Unhog kills processes that usually take up the majority of your RAM.
# Has a few builtin targets, or you can override with your own by setting 
# the TO_UNHOG environment variable.

# Usage:
#   Kill default targets: 
#       unhog
#   Kill firefox:
#       unhog firefox
#   Kill multiple applications:
#       unhog firefox thunderbird chrome

function unhog {
    system_targets=$TO_UNHOG
    builtin_targets="firefox code thunderbird"
    default_targets=${system_targets:-$builtin_targets}

    targets=${@:-$default_targets}

    # echo "System targets: $system_targets"
    # echo "Built-in targets: $builtin_targets"
    # echo "Default targets: $default_targets"
    # echo "Final targets: $targets"

    for target in $targets; do
        echo "Killing $target..."
        taskkill -f -im "$target*" > /dev/null
    done
}