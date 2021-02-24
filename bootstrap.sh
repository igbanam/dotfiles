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

echo "Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Setup NVim from Vim..."
if [[ -f "$HOME/.config/nvim" ]]; then
  echo "NVim is already configured... nothing to do here."
else
  mkdir -p "$HOME/.config/nvim"
  touch "$HOME/.config/nvim/init.vim"
  cat << NVIM_FROM_VIM >> $HOME/.config/nvim/init.vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
NVIM_FROM_VIM
fi

echo "Check and create the ~/projects directory..."
mkdir -p ~/projects

if [[ ! -z `grep "export GIT_BASE_BRANCH=master" "$HOME/.zprofile"` ]]; then
  echo "export GIT_BASE_BRANCH=master" >> $HOME/.zprofile
fi

# Configure!
rm ~/.vimrc
rm ~/.gitconfig
rm ~/.gitignore-system
ln -sfv "$COTG_PATH/vimrc" ~/.vimrc
ln -sfv "$COTG_PATH/gitconfig" ~/.gitconfig
ln -sfv "$COTG_PATH/gitignore-system" ~/.gitignore-system

if [ ! -z `grep "alias vim=nvim" "$HOME/.zshrc"` ]; then
  echo "alias vim=nvim" >> $HOME/.zshrc
fi
