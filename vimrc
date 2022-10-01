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

runtime vim.d/plugs.vim
runtime! vim.d/core/*.vim
runtime! vim.d/plug/*.vim
