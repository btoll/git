#!/bin/bash
# Installation script for custom Git extensions and aliases.

echo "[Install] Creating global git aliases..."
git config --global alias.get-hash '!sh -c '"'git show \$0 | grep commit | cut -c8-'"
git config --global alias.goto '!sh -c '"'git show \$0 | grep commit | cut -c8- | xargs git checkout'"

echo "[Install] Creating symbolic links for git extensions..."
echo
pushd bin
ln -s "$PWD"/git-cleanup /usr/local/bin/git-cleanup
ln -s "$PWD"/git-hub /usr/local/bin/git-hub
ln -s "$PWD"/git-introduced /usr/local/bin/git-introduced
ln -s "$PWD"/git-ls /usr/local/bin/git-ls
popd

echo "[Install] Installing git man pages..."
echo
pushd man
ln -s "$PWD"/git-cleanup.1 /usr/local/share/man/man1/git-cleanup.1
ln -s "$PWD"/git-hub.1 /usr/local/share/man/man1/git-hub.1
ln -s "$PWD"/git-introduced.1 /usr/local/share/man/man1/git-introduced.1
ln -s "$PWD"/git-ls.1 /usr/local/share/man/man1/git-ls.1
popd

echo
echo "[Install] Installation complete."

