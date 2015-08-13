#!/bin/bash

EXIT_CODE=0
FILES=$(git diff-index --cached --name-only HEAD)

echo "$(tput setab 7)$(tput setaf 4)[INFO]$(tput sgr0) Running $(tput bold)debugger$(tput sgr0) pre-commit hook..."

for F in $FILES; do
    if [[ $(gawk '/^\s*debugger;?\y/' $F) ]]; then
        echo "\t$(tput setaf 1)[ERROR]$(tput sgr0) The script $F contains an uncommented debugger statement."
        EXIT_CODE=1
    fi
done

if [ "$EXIT_CODE" -eq 0 ]; then
    echo "$(tput setab 7)$(tput setaf 2)[INFO]$(tput sgr0) Completed successfully."
fi

exit $EXIT_CODE

