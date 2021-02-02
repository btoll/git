#!/bin/bash

mkdir -p "$HOME/bin"

echo "$(tput setaf 2)[INFO]$(tput sgr0) Creating global git aliases..."
git config --global alias.dirty 'ls --dirty -e'
git config --global alias.get-hash rev-parse
git config --global alias.goto '!sh -c '"'git rev-parse \$0 | xargs git checkout'"
#git config --global --add hooks.pre-commit.hook "EOF.bash"
#git config --global --add hooks.pre-commit.hook "debugger.bash"
#git config --global --add hooks.pre-commit.hook "eslint.bash"

echo "$(tput setaf 2)[INFO]$(tput sgr0) Installing git extensions..."
echo
pushd bin
ln -s "$PWD"/git-bootstrap "$HOME/bin/git-bootstrap"
ln -s "$PWD"/git-cleanup "$HOME/bin/git-cleanup"
ln -s "$PWD"/git-hub "$HOME/bin/git-hub"
ln -s "$PWD"/git-introduced "$HOME/bin/git-introduced"
ln -s "$PWD"/git-ls "$HOME/bin/git-ls"
popd

echo
echo "$(tput setaf 2)[INFO]$(tput sgr0) Installation complete."

