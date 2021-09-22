#!/bin/bash

set -e

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
