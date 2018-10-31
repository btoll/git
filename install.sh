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
ln -s "$PWD"/git-cleanup ~/bin/git-bootstrap
ln -s "$PWD"/git-cleanup ~/bin/git-cleanup
ln -s "$PWD"/git-hub ~/bin/git-hub
ln -s "$PWD"/git-introduced ~/bin/git-introduced
ln -s "$PWD"/git-ls ~/bin/git-ls
popd

echo
echo "$(tput setaf 2)[INFO]$(tput sgr0) Installation complete."

