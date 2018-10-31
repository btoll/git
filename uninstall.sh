#!/bin/bash

echo "$(tput setaf 2)[INFO]$(tput sgr0) Unsetting global git aliases..."
echo
git config --global --unset alias.get-hash
git config --global --unset alias.goto

echo "$(tput setaf 2)[INFO]$(tput sgr0) Removing symbolic links for git extensions..."
echo
rm ~/bin/git-bootstrap
rm ~/bin/git-cleanup
rm ~/bin/git-hub
rm ~/bin/git-introduced
rm ~/bin/git-ls

echo "$(tput setaf 2)[INFO]$(tput sgr0) Removing git man pages..."
echo
rm /usr/local/share/man/man1/git-cleanup.1
rm /usr/local/share/man/man1/git-hub.1
rm /usr/local/share/man/man1/git-introduced.1
rm /usr/local/share/man/man1/git-ls.1

echo
echo "$(tput setaf 2)[INFO]$(tput sgr0) Uninstall complete."

