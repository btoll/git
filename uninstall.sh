#!/bin/bash

echo "[Uninstall] Unsetting global git aliases..."
echo
git config --global --unset alias.get-hash
git config --global --unset alias.goto

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

