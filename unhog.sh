#!/bin/bash

# Unhog kills processes that usually take up the majority of your RAM.
# Has a few builtin targets, or you can override with your own by setting 
# the TO_UNHOG environment variable.

# Usage:
#   unhog (targets...)
#   (targets...) is optional, and can be multiple targets

# Usage examples:
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

    ram_before=$(mem_free)

    # echo "System targets: $system_targets"
    # echo "Built-in targets: $builtin_targets"
    # echo "Default targets: $default_targets"
    # echo "Final targets: $targets"

    for target in $targets; do
        echo "Killing $target..."
        taskkill -f -im "$target*" > /dev/null
    done

    ram_after=$(mem_free)

    echo "Free memory: $((ram_before/1024)) kB -> $((ram_after/1024)) kB"
    echo "Gained memory:" $(( (100*$ram_after)/$ram_before - 100 )) "%"
}