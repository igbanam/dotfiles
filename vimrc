vim9script

scriptencoding utf-8
set encoding=utf-8

# leader
g:mapleader = " "

# When the file is large, we have some performance issues.
# I define a large file as a file with more than 1000 lines
# For these files, I have realized using the old regexengine
# serves me better.
#
# TODO: Check if this is the case with Vim9
if line('$') > 1000
  set re=1
endif

# Windows Vim uses ~/vimfiles and symlinks need admin rights there. Mirror the
# Unix ~/.vim layout, and put this repo on the runtimepath so vim.d is found
# without linking it. See README.
if has('win32')
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  execute 'set runtimepath^=' .. fnameescape(expand('<script>:p:h'))
endif

runtime ./vim.d/plugs.vim
runtime! ./vim.d/core/*.vim
runtime! ./vim.d/plug/*.vim
