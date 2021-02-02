#!/bin/bash

if [ $EUID -ne 0 ]; then
echo -e "$(tput setaf 1)[ERROR]$(tput sgr0) This script must be run as root!" 1>&2
    exit 1
fi

echo "$(tput setaf 2)[INFO]$(tput sgr0) Installing git man pages..."
echo
pushd man
ln -s "$PWD"/git-bootstrap.1 /usr/share/man/man1/git-bootstrap.1
ln -s "$PWD"/git-cleanup.1 /usr/share/man/man1/git-cleanup.1
ln -s "$PWD"/git-hub.1 /usr/share/man/man1/git-hub.1
ln -s "$PWD"/git-introduced.1 /usr/share/man/man1/git-introduced.1
ln -s "$PWD"/git-ls.1 /usr/share/man/man1/git-ls.1
popd

echo
echo "$(tput setaf 2)[INFO]$(tput sgr0) Installation complete."

