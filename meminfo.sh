#!/bin/bash

# Get free RAM in bytes
# Can specify the following flags to set unit: 
#   -kb -mb -gb
# If flag is unknown, bytes will be used

# Examples: 
#   mem_free
#   mem_free -mb
#   mem_free -kb -mb

function mem_free {
    meminfo=$(cat /proc/meminfo | grep MemFree)
    free_kilobytes=$(echo $meminfo | cut -d " " -f 2)
    free_bytes=$((free_kilobytes*1024))

    for arg in ${@:-b}; do
        case $arg in
            "-kb")
                echo "$((free_bytes / 1024)) KB"
            ;;

            "-mb")
                echo "$((free_bytes / (1024**2) )) MB"
            ;;

            "-gb")
                echo "$((free_bytes / (1024**3) )) GB"
            ;;

            *)
                echo $free_bytes
            ;;
        esac
    done
}