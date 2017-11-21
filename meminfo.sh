#!/bin/bash

function mem_free {
    meminfo=$(cat /proc/meminfo | grep MemFree)
    free_kilobytes=$(echo $meminfo | cut -d " " -f 2)
    free_bytes=$((free_kilobytes*1024))

    echo $free_bytes
}