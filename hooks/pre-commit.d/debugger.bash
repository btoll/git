#!/bin/bash

EXIT_CODE=0
FILES=$(git diff-index --cached --name-only HEAD 2> /dev/null | ag -l --vimgrep "^\s*debugger;?")

echo "$(tput setab 7)$(tput setaf 4)[INFO]$(tput sgr0) Running $(tput bold)debugger$(tput sgr0) pre-commit hook..."

if [ -n "$FILES" ]; then
    echo "$(tput setaf 1)[ERROR]$(tput sgr0) There is an uncommented debugger statement in the following files(s):"
    echo "$FILES"

    EXIT_CODE=1
fi

if [ $EXIT_CODE -eq 0 ]; then
    echo "$(tput setab 7)$(tput setaf 2)[INFO]$(tput sgr0) Completed successfully."
fi

exit $EXIT_CODE

