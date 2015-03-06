#!/bin/bash

usage() {
    echo "Installation script for custom Git extensions and aliases."
    echo
    echo "Usage: $0 [args]"
    echo
    echo "Args:"
    echo "--prefix  The location where the git remote repository will be cloned."
    echo "          Defaults to CWD."
}

while [ "$#" -gt 0 ]; do
    OPT="$1"
    case $OPT in
        --help|-help|-h) usage; exit 0 ;;
        --prefix) shift; GIT=$(echo $1 | tr -d '\r') ;;
    esac
    shift
done

# https://github.com/btoll/git
if [ -n "$GIT" ]; then
    pushd "$GIT" > /dev/null
fi

echo "[Install] Cloning remote 'git' repository into $GIT."
echo
git clone git@github.com:btoll/git.git

echo
echo "[Install] Creating global git aliases..."
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.get-hash '!sh -c '"'git show \$0 | grep commit | cut -c8-'"
git config --global alias.goto '!sh -c '"'git show \$0 | grep commit | cut -c8- | xargs git co'"
git config --global alias.last "log -1 HEAD"
git config --global alias.st status
git config --global alias.unmodify = "checkout --"
git config --global alias.unstage = "reset HEAD --"

echo "[Install] Creating symbolic links for git extensions..."
echo
cd git/bin
ln -s "$PWD"/git-cleanup /usr/local/bin/git-cleanup
ln -s "$PWD"/git-hub /usr/local/bin/git-hub
ln -s "$PWD"/git-introduced /usr/local/bin/git-introduced
ln -s "$PWD"/git-ls /usr/local/bin/git-ls
cd -

echo "[Install] Installing git man pages..."
echo
cd git/man
ln -s "$PWD"/git-cleanup.1 /usr/local/share/man/man1/git-cleanup.1
ln -s "$PWD"/git-hub.1 /usr/local/share/man/man1/git-hub.1
ln -s "$PWD"/git-introduced.1 /usr/local/share/man/man1/git-introduced.1
ln -s "$PWD"/git-ls.1 /usr/local/share/man/man1/git-ls.1
cd -

if [ -n "$GIT" ]; then
    popd > /dev/null
fi

echo
echo "[Install] Installation complete."

