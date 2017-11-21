#!/bin/bash

# Function to find all code labels in directory 
# Useful for finding TODO's or NOTE's and the like 
# Anywhere in your code, put a comment in the form // <LABEL>: ...
# and findlabels will pick it up

# Usage: 
#     findlabels <directory> (labels)
#     (labels) is optional, put spaces between labels if you look for multiple

# Examples: 
#     findlabels . TODO
#     findlabels src "TODO ISSUE TEST"
function findlabels {
    default_dir='.'
    default_labels=${LABELS:-"TODO TEST NOTE ISSUE"}
    default_excludes='*/.svn/* */.git/*'

    directory=${1:-$default_dir}
    excludes=$default_excludes
    labels=${2:-$default_labels}

    exclude_str=''

    for exclude in $excludes; do
        exclude_str="$exclude_str -not -path '$exclude'"
    done

    label_str=''

    for label in $labels; do
        label_str="$label_str|$label"
    done

    # Strip first pipe
    label_str=${label_str:1}

    pattern="//.*($label_str)"

    echo "Directory: $directory"
    echo "Labels: $labels"
    echo "Excludes: $exclude_str"
    echo "Pattern: $pattern"

    find $directory -type f $exclude_str -exec grep -En "$pattern" {} + | cat
}