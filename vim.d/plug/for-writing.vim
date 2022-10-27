vim9script

g:markdown_folding = 1

# Formatting (vim-easy-align) -------------------------------------------- {{{
# Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

# Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
# ------------------------------------------------------------------------ }}}
# Writing (vim-pandoc[-syntax], vim-pencil, goyo.vim, ultisnips) --------- {{{
g:goyo_width = 100
g:goyo_height = 40
g:goyo_linenr = 1

g:pencil#wrapModeDefault = 'soft'
g:pencil#textwidth = 74
g:pencil#joinspaces = 0
g:pencil#cursorwrap = 1
g:pencil#conceallevel = 3
g:pencil#concealcursor = 'c'
g:pencil#softDetectSample = 20
g:pencil#softDetectThreshold = 130

g:pandoc#filetypes#pandoc_markdown = 0

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
        \ | setl spell spl=en_gb fdl=4
        \ | setl fdo+=search
        # \ | nnoremap <buffer> <leader>mg :<c-u>call GraphThis()<cr>
augroup END

def GoyoEnter()
  if executable('tmux') && exists('$TMUX')
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set nonu
  set nornu
  set scrolloff=999
  Limelight
enddef

def GoyoLeave()
  if executable('tmux') && exists('$TMUX')
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set nu
  set rnu
  set scrolloff=5
  Limelight!
enddef

autocmd! User GoyoEnter ++nested GoyoEnter()
autocmd! User GoyoLeave ++nested GoyoLeave()

g:UltiSnipsEditSplit = "vertical"
# ------------------------------------------------------------------------ }}}
# Auto Save (vim-auto-save) ---------------------------------------------- {{{
g:auto_save = 1                 # enable autosave on vim startup
g:auto_save_in_insert_mode = 0  # do not save while in insert mode
# ------------------------------------------------------------------------ }}}
