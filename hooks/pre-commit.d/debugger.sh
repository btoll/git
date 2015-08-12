#!/bin/bash

FILES=$(git diff-index --cached --name-only HEAD | xargs ack "^\s*debugger;?\b")

echo "$(tput setab 7)$(tput setaf 4)[INFO]$(tput sgr0) Running $(tput bold)debugger$(tput sgr0) pre-commit hook..."

if [[ -n "$FILES" ]]; then
    echo "\t$(tput setaf 1)[ERROR]$(tput sgr0) You have left a debugger statement in the following files:"
    echo "\t\t$FILES\n"
    exit 1
fi

echo "$(tput setab 7)$(tput setaf 2)[INFO]$(tput sgr0) Completed successfully."

exit 0

