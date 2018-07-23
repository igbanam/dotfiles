" Leader
let mapleader = " "

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

set autowrite          " Automatically :write before running commands
set backspace=2        " Backspace deletes like most programs in insert mode
set expandtab
set history=50
set incsearch          " do incremental searching
set laststatus=2       " Always display the status line
set nobackup
set noswapfile         " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set nowritebackup
set number             " Numbers
set numberwidth=5
set ruler              " show the cursor position all the time
set shiftround
set shiftwidth=2
set showcmd            " display incomplete commands
set tabstop=2          " Softtabs, 2 spaces

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

""" Bundles

let g:has_async = v:version >= 800 || has('nvim')

call plug#begin('~/.vim/bundle')

" Colours
Plug 'dikiaap/minimalist'

" Plugins
Plug 'christoomey/vim-run-interactive'
Plug 'docunext/closetag.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'ervandew/supertab'
Plug 'hzchirs/vim-material'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'pbrisbin/vim-mkdir'
Plug 'sheerun/vim-polyglot'
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

" Airline
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled = 1

" Auto Save
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode

" FZF
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

""" Mappings

" Buffers
set hidden
nnoremap [b :bprev<CR>
nnoremap ]b :bnext<CR>

" Window Shenanigans
" Close buffers quicker!
nmap <S-w> :bd<CR>
" Select all
nnoremap <C-a> ggVG<CR>

" FZF to Ctrl+P
nnoremap <C-p> :FZF<CR>

" Limelight
nmap <Leader>ll :Limelight!!<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" vim-commentary
map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine
