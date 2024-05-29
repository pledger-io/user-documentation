#!/bin/bash
# Recursively list all git-controlled files in the current directory
# and set their modification date to match the time of the most recent commit.

if [ $# = 0 ]; then
    git ls-files -z | xargs -0 sh "$0"
    exit $?
fi

for file in "$@"; do
    time="$(git log --pretty=format:%cd -n 1 --date=format:%Y%m%d%H%M.%S --date-order -- "$file")"
    if [ -z "$time" ]; then
        echo "ERROR: Skipping '$file' -- no git log found" >&2
        continue
    else
        echo "Setting '$file' to $time"
    fi
    touch -m -t "$time" "$file"
done