vim9script

# Folding (vim-anyfold) -------------------------------------------------- {{{
augroup fold_schemes
  autocmd!
  autocmd Filetype crystal setlocal foldmethod=syntax
  # autocmd Filetype php,java,ruby,json,typescriptreact,ledger AnyFoldActivate
  autocmd Filetype vim setlocal foldmethod=marker
  autocmd Syntax xml,html.erb,xhtml,html setlocal foldmethod=indent
augroup END

autocmd BufEnter * if !exists('b:anyfold_ind_actual') | b:anyfold_ind_actual = [] | endif

g:anyfold_fold_comments = 1
g:anyfold_identify_comments = 2
g:anyfold_comments = [
  'comment',
  'string',
  'external',
  'include'
]
# ------------------------------------------------------------------------ }}}
