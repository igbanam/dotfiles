vim9script

# Miscellaneous ---------------------------------------------------------- {{{
command! GenerateTags !ctags -R .

# ===========
# Format JSON
# ===========
command! -range FormatJSON FormatJSON(<line1>, <line2>)
def FormatJSON(line1: number, line2: number)
  var json_range = $'{line1},{line2}'
  execute ':' .. json_range .. "!python -m json.tool"
enddef

# Convert within visual selection
vnoremap <leader>pp :FormatJSON<cr>

# Convert entire file
nnoremap <leader>pp  :0,$ FormatJSON<cr>

# Bubble lines
nmap <leader>mu ddkP
nmap <leader>md ddp

# Bubble blocks
vmap <leader>mu xkP`[V`]
vmap <leader>md xp`[V`]

# Copy blocks to Mac clipboard
vmap <leader>cp "+y

augroup all_things_scala
  au!
  autocmd BufNewFile,BufRead *.sbt,*.sc set filetype=scala
augroup END

# Finger Motions
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>eo :e $MYVIMRC<cr>
nmap <leader>r  :redraw!<cr>
# ------------------------------------------------------------------------ }}}
