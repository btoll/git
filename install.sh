#!/bin/bash
# Installation script for custom Git extensions and aliases.

echo "$(tput setaf 2)[INFO]$(tput sgr0) Creating global git aliases..."
git config --global alias.get-hash rev-parse
git config --global alias.goto '!sh -c '"'git rev-parse \$0 | xargs git checkout'"
git config --global --add hooks.pre-commit.hook "EOF.sh"
git config --global --add hooks.pre-commit.hook "debugger.sh"
git config --global --add hooks.pre-commit.hook "eslint.sh"

echo "$(tput setaf 2)[INFO]$(tput sgr0) Installing git extensions..."
echo
pushd bin
ln -s "$PWD"/git-cleanup /usr/local/bin/git-bootstrap
ln -s "$PWD"/git-cleanup /usr/local/bin/git-cleanup
ln -s "$PWD"/git-hub /usr/local/bin/git-hub
ln -s "$PWD"/git-introduced /usr/local/bin/git-introduced
ln -s "$PWD"/git-ls /usr/local/bin/git-ls
popd

echo "$(tput setaf 2)[INFO]$(tput sgr0) Installing git man pages..."
echo
pushd man
ln -s "$PWD"/git-cleanup.1 /usr/local/share/man/man1/git-cleanup.1
ln -s "$PWD"/git-hub.1 /usr/local/share/man/man1/git-hub.1
ln -s "$PWD"/git-introduced.1 /usr/local/share/man/man1/git-introduced.1
ln -s "$PWD"/git-ls.1 /usr/local/share/man/man1/git-ls.1
popd

echo
echo "$(tput setaf 2)[INFO]$(tput sgr0) Installation complete."

