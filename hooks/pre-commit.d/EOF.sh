#!/bin/bash

EXIT_CODE=0
FILES=$(git diff-index --cached --name-only HEAD 2> /dev/null)

echo "$(tput setab 7)$(tput setaf 4)[INFO]$(tput sgr0) Running $(tput bold)EOF$(tput sgr0) pre-commit hook..."

for F in $FILES; do
    MIMETYPE=$(file --mime-type -b "$F")

    if [[
        ( $MIMETYPE == image/gif ) ||
        ( $MIMETYPE == image/jpg ) ||
        ( $MIMETYPE == image/png )
    ]]; then
        continue
    fi

    if [[ $(awk 'END{print ($0=="")}' $F 2> /dev/null) == 0 ]]; then
        echo "\t$(tput setaf 1)[ERROR]$(tput sgr0) The script $F does not end with a blank line."
        EXIT_CODE=1
    fi
done

if [[ $EXIT_CODE -eq 0 ]]; then
    echo "$(tput setab 7)$(tput setaf 2)[INFO]$(tput sgr0) Completed successfully."
fi

exit $EXIT_CODE

