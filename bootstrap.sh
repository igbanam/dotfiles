#!/bin/sh

echo "Setup critical environment variables..."
export COTG_PATH
COTG_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Checking for updates..."
if is-executable git -a -d "$DOTFILES_DIR/.git"; then
  git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master;
fi

echo "Installing Homebrew..."
. "$COTG_PATH/bootstrap/brew.sh"

echo "Installing RVM..."
. "$COTG_PATH/bootstrap/rvm.sh"

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Projects Directory
if [ ! -d "~/projects" ]; then
  mkdir ~/projects
fi

# Configure!
ln -sfv "$COTG_PATH/vimrc" ~/.vimrc
ln -sfv "$COTG_PATH/gitconfig" ~/.gitconfig
ln -sfv "$COTG_PATH/gitignore-system" ~/.gitignore-system
