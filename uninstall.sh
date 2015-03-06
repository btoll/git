#!/bin/bash

usage() {
    echo "Uninstall script for custom Git extensions and aliases."
    echo
    echo "Usage: $0 [args]"
    echo
    echo "Args:"
    echo "--force, -force, -f  Remove the global git aliases."
    echo "                     Default is not to remove."
}

while [ "$#" -gt 0 ]; do
    OPT="$1"
    case $OPT in
        --force|-force|-f) REMOVE_ALIASES=true ;;
        --help|-help|-h) usage; exit 0 ;;
    esac
    shift
done

if [ -n "$REMOVE_ALIASES" ]; then
    echo
    echo "[Uninstall] Unsetting global git aliases..."
    git config --global --unset alias.br
    git config --global --unset alias.ci
    git config --global --unset alias.co
    git config --global --unset alias.get-hash
    git config --global --unset alias.goto
    git config --global --unset alias.last
    git config --global --unset alias.st
    git config --global --unset alias.unmodify
    git config --global --unset alias.unstage
fi

echo "[Uninstall] Removing symbolic links for git extensions..."
echo
rm /usr/local/bin/git-cleanup
rm /usr/local/bin/git-hub
rm /usr/local/bin/git-introduced
rm /usr/local/bin/git-ls

echo "[Uninstall] Removing git man pages..."
echo
rm /usr/local/share/man/man1/git-cleanup.1
rm /usr/local/share/man/man1/git-hub.1
rm /usr/local/share/man/man1/git-introduced.1
rm /usr/local/share/man/man1/git-ls.1

echo
echo "[Uninstall] Uninstall complete."

