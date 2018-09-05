" leader
let mapleader = " "

" switch syntax highlighting on, when the terminal has colors
" also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

set autowrite          " automatically :write before running commands
set backspace=2        " backspace deletes like most programs in insert mode
set complete-=i        " do not parse included files in autocomplete
set expandtab
set history=50
set incsearch          " do incremental searching
set laststatus=2       " always display the status line
set nobackup
set noswapfile         " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set nowritebackup
set number             " numbers
set numberwidth=5
set relativenumber
set ruler              " show the cursor position all the time
set shiftround
set shiftwidth=2
set showcmd            " display incomplete commands
set tabstop=2          " softtabs, 2 spaces

" display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

""" auto groups
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

""" bundles

let g:has_async = v:version >= 800 || has('nvim')

call plug#begin('~/.vim/bundle')

" colours
Plug 'dikiaap/minimalist'

" plugins
Plug 'christoomey/vim-run-interactive'
Plug 'docunext/closetag.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'ervandew/supertab'
Plug 'hzchirs/vim-material'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'pbrisbin/vim-mkdir'
Plug 'sheerun/vim-polyglot'
Plug 'slashmili/alchemist.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'      " that awesome statusbar
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/vim-auto-save'

if g:has_async
  Plug 'w0rp/ale'
endif

call plug#end()

""" Configurations
colorscheme minimalist

" Airline ---------------------------------------------------------------- {{{
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled = 1
" ------------------------------------------------------------------------ }}}

" Auto Save -------------------------------------------------------------- {{{
let g:auto_save = 1  " enable autosave on vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
" ------------------------------------------------------------------------ }}}

" FZF -------------------------------------------------------------------- {{{
let $fzf_default_command = 'ag --hidden --ignore .git -l -g ""'
" ------------------------------------------------------------------------ }}}

" Ruby (vim-ruby) -------------------------------------------------------- {{{
let ruby_fold = 1
let ruby_foldable_groups = 'def'
" ------------------------------------------------------------------------ }}}

""" Mappings

" Buffers
set hidden
nnoremap [b :bprev<cr>
nnoremap ]b :bnext<cr>

" Window Shenanigans
" Close Buffers Quicker!
nmap <s-w> :bd<cr>
" Select All
nnoremap <c-a> ggvG

" FZF to Ctrl+P
nnoremap <c-p> :FZF<cr>

" Limelight
nmap <leader>ll :Limelight!!<cr>

" Quicker Window Movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" vim-commentary
map  gc  <plug>Commentary
nmap gcc <plug>CommentaryLine
