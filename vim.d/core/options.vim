vim9script

set backspace=2        # backspace deletes like most programs in insert mode
set complete-=i        # do not parse included files in autocomplete
set diffopt+=vertical  # force fugitive to diff using vertical splits
set expandtab          # convert tabs to spaces; KISS
set exrc               # project-specific vimrc
set history=50         # increase how many entries we can keep in the history
set incsearch          # do incremental searching
set laststatus=2       # always display the status line
set noautowrite        # handled by vim-auto-save
set nobackup           # I don't like them .swp files; I already have Git
set nocursorcolumn
set nocursorline
set noswapfile         # http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set nowritebackup      # Still on them .swp files; don't need them
set number             # numbers
set numberwidth=5      # How big do you want your gutter to the left?
set relativenumber     # Cool +/- relative to the cursor
set ruler              # show the cursor position all the time
set shiftround         # Round the indentation to the nearest shiftwidth
set shiftwidth=2       # How big should our shifts/tabs be?
set showcmd            # display incomplete commands
set splitright         # open a new split in the more natural position
set tabstop=2          # softtabs, 2 spaces
set textwidth=80       # so we can wrap text
set thesaurus=/Users/igbanam/.vim/thesaurus.txt
set wildmenu
set wildoptions=pum

# Display extra whitespace ----------------------------------------------- {{{
set list listchars=tab:»·,trail:·,nbsp:·
# Display extra whitespace ----------------------------------------------- }}}
# Spaces for specific file types ----------------------------------------- {{{
augroup IntentionalIndentations
  autocmd!
  autocmd Filetype php,java setlocal tabstop=4 expandtab shiftwidth=4
  autocmd Filetype svelte setlocal textwidth=0
augroup END
# ------------------------------------------------------------------------ }}}
