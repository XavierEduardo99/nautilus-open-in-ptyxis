#!/usr/bin/env bash

DIR="$1"

# Exact old and new line
OLD='for PACKAGE package'
NEW='for nautilus-open-in-ptyxis 0.1'

find "$DIR" -type f -name "*.po" -print0 |
while IFS= read -r -d '' file; do
    # Replace the whole line
    sed -i "s|$OLD|$NEW|" "$file"
done

