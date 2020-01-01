#!/bin/bash

set -e

echo "Setup critical environment variables..."
export COTG_PATH
COTG_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Bring in the helper dwarfs..."
PATH="$COTG_PATH/bin:$PATH"

echo "Checking for updates..."
if is-executable git -a -d "$COTG_PATH/.git"; then
  git --work-tree="$COTG_PATH" --git-dir="$COTG_PATH/.git" pull origin master;
fi

echo "Installing Homebrew..."
. "$COTG_PATH/bootstrap/brew.sh"

echo "Installing RVM..."
. "$COTG_PATH/bootstrap/rvm.sh"

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Projects Directory
mkdir -p ~/projects

# Configure!
ln -sfv "$COTG_PATH/vimrc" ~/.vimrc
ln -sfv "$COTG_PATH/gitconfig" ~/.gitconfig
ln -sfv "$COTG_PATH/gitignore-system" ~/.gitignore-system

if [ ! -z `grep "alias vim=nvim" "$HOME/.bashrc"` ]; then
  echo "alias vim=nvim" >> $HOME/.bashrc
fi
