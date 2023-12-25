vim9script

# Folding (vim-anyfold) -------------------------------------------------- {{{
augroup fold_schemes
  autocmd!
  autocmd Filetype crystal setlocal foldmethod=syntax
  autocmd Filetype php,java,json,typescriptreact AnyFoldActivate
  autocmd Filetype vim set foldmethod=marker
  autocmd Syntax xml,html.erb,xhtml,html setlocal foldmethod=indent
augroup END

g:anyfold_fold_comments = 1
g:anyfold_identify_comments = 2
g:anyfold_comments = [
  'comment',
  'string',
  'external',
  'include'
]
# ------------------------------------------------------------------------ }}}
