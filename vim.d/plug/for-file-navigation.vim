vim9script

# File Navigation (fzf, fzf.vim, nerdtree) ------------------------------- {{{
# FZF
$FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore sorbet -l -g ""'
# $FZF_DEFAULT_OPTS = '--track'
g:fzf_colors =
  { 'fg':      ['fg', 'Normal'],
    'bg':      ['bg', 'Normal'],
    'hl':      ['fg', 'Comment'],
    'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    'hl+':     ['fg', 'Statement'],
    'info':    ['fg', 'PreProc'],
    'border':  ['fg', 'Ignore'],
    'prompt':  ['fg', 'Conditional'],
    'pointer': ['fg', 'Exception'],
    'marker':  ['fg', 'Keyword'],
    'spinner': ['fg', 'Label'],
    'header':  ['fg', 'Comment'] }
nnoremap <c-p> :FZF<cr>

# NERDTree
map <C-n> :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
# ------------------------------------------------------------------------ }}}
