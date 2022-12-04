vim9script

# Folding (vim-anyfold) -------------------------------------------------- {{{
augroup fold_schemes
  autocmd!
  autocmd Filetype crystal setlocal foldmethod=syntax
  autocmd Filetype php,json AnyFoldActivate
  autocmd Filetype vim set foldmethod=marker
  autocmd Syntax xml,html.erb,xhtml,html setlocal foldmethod=indent
augroup END

g:anyfold_fold_comments = 1
# ------------------------------------------------------------------------ }}}
