vim9script

# File Navigation (fzf, fzf.vim, nerdtree) ------------------------------- {{{
# FZF - use ripgrep for file listing (faster, respects .gitignore)
if executable('rg')
  $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git" --glob "!sorbet"'
elseif executable('ag')
  # Fallback to ag if ripgrep not available
  $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore sorbet -l -g ""'
endif

$FZF_DEFAULT_OPTS = '--bind up:preview-up,down:preview-down'
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

# FZF window layout
g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8, 'border': 'rounded' } }
g:fzf_preview_window = ['right:50%', 'ctrl-/']

nnoremap <c-p> :FZF<cr>

# NERDTree
map <C-n> :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
# g:NERDTreeFileLines = 1
g:NERDTreeNaturalSort = 1
g:NERDTreeWinSizeMax = 80
# ------------------------------------------------------------------------ }}}

# Git Ops (fzf + git) ---------------------------------------------------- {{{
command! -bang -nargs=0 Branches
            \ call fzf#run({
            \   'source': "git branch -a",
            \   'sink': 'git o',
            \   'down': '40%',
            \   'options': '--prompt="*Branches> " --bind="ctrl-d:page-down,ctrl-u:page-up" --preview="echo {} | sed \"s/\*//\" | sed \"s/^ *//;s/ *$//\" | xargs git lr"'
            \ })
# Courtesy of https://stackoverflow.com/a/76731081/393021
# ------------------------------------------------------------------------ }}}

# Git Extras ------------------------------------------------------------- {{{
# git-messenger: show commit message under cursor
g:git_messenger_always_into_popup = v:true
g:git_messenger_include_diff = 'current'
nmap <leader>gm <Plug>(git-messenger)

# undotree: visual undo history
nnoremap <leader>ut :UndotreeToggle<CR>
# ------------------------------------------------------------------------ }}}
