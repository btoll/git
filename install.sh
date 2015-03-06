#!/bin/bash

usage() {
    echo "Installation script for custom Git and other CLI tools."
    echo
    echo "Usage: $0 [args]"
    echo
    echo "Args:"
    echo "--git-prefix    The location where the git remote repository will be cloned."
    echo "                Defaults to CWD."
    echo
    echo "--utils-prefix  The location where the utils remote repository will be cloned."
    echo "                Defaults to CWD."
}

while [ "$#" -gt 0 ]; do
    OPT="$1"
    case $OPT in
        --git-prefix) shift; GIT=$(echo $1 | tr -d '\r') ;;
        --help|-help|-h) usage; exit 0 ;;
        --utils-prefix) shift; UTILS=$(echo $1 | tr -d '\r') ;;
    esac
    shift
done

# https://github.com/btoll/git
if [ -n "$GIT" ]; then
    pushd "$GIT" > /dev/null
fi

echo "[Install] Cloning remote 'git' repository into $GIT..."
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
ln -s "$PWD"/git/bin/git-cleanup /usr/local/bin/git-cleanup
ln -s "$PWD"/git/bin/git-hub /usr/local/bin/git-hub
ln -s "$PWD"/git/bin/git-introduced /usr/local/bin/git-introduced
ln -s "$PWD"/git/bin/git-ls /usr/local/bin/git-ls

if [ -n "$GIT" ]; then
    popd > /dev/null
fi

# https://github.com/btoll/utils
if [ -n "$UTILS" ]; then
    pushd "$UTILS" > /dev/null
fi

echo "[Install] Cloning remote 'utils' repository into $UTILS..."
echo
git clone git@github.com:btoll/utils.git

echo "[Install] Creating symbolic links for utils..."
echo
ln -s "$PWD"/utils/bootstrap.sh /usr/local/bin/bootstrap
ln -s "$PWD"/utils/check-dependencies.sh /usr/local/bin/check-dependencies
ln -s "$PWD"/utils/get-fiddle.sh /usr/local/bin/get-fiddle
ln -s "$PWD"/utils/make_file.sh /usr/local/bin/make_file
ln -s "$PWD"/utils/make_ticket.sh /usr/local/bin/make_ticket

# https://github.com/btoll/utils/tree/master/tmux
ln -s "$PWD"/utils/tmux/tmuxly.sh /usr/local/bin/tmuxly

if [ -n "$UTILS" ]; then
    popd > /dev/null
fi

echo
echo "[Install] Installation complete."

