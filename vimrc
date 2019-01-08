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
set diffopt+=vertical  " forcing figutive to diff using vertical splits
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

augroup fold_schemes
  autocmd!
  autocmd Filetype crystal setlocal foldmethod=syntax
  autocmd Syntax xml,html.erb,xhtml setlocal foldmethod=indent
augroup END
""" bundles

let g:has_async = v:version >= 800 || has('nvim')

call plug#begin('~/.vim/bundle')

" colours
Plug 'Badacadabra/vim-archery'
Plug 'challenger-deep-theme/vim'
Plug 'dikiaap/minimalist'
Plug 'hzchirs/vim-material'
Plug 'jacoborus/tender.vim'
Plug 'junegunn/seoul256.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'liuchengxu/space-vim-dark'
Plug 'rakr/vim-one'
Plug 'romainl/Apprentice'
Plug 'vim-scripts/twilight256.vim'
Plug 'vim-scripts/wombat256.vim'

" plugins
Plug 'asheq/close-buffers.vim'
Plug 'docunext/closetag.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'ervandew/supertab'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'pbrisbin/vim-mkdir'
Plug 'qpkorr/vim-bufkill'
Plug 'sheerun/vim-polyglot'
Plug 'slashmili/alchemist.vim'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-heroku'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'      " that awesome statusbar
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'ecomba/vim-ruby-refactoring'
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
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
" ------------------------------------------------------------------------ }}}

" Ruby (vim-rspec) ------------------------------------------------------- {{{
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:rspec_runner = "os_x_iterm"

augroup crystal_rspec_bind
  autocmd!
  autocmd Filetype crystal let g:rspec_command="!crystal spec"
augroup END
" ------------------------------------------------------------------------ }}}

" Ruby (vim-ruby) -------------------------------------------------------- {{{
let ruby_fold = 1
let ruby_foldable_groups = 'def do'
" ------------------------------------------------------------------------ }}}

""" Mappings

" Buffers
set hidden
nnoremap [b :bprev<cr>
nnoremap ]b :bnext<cr>

" Window Shenanigans
nmap <leader>w :bp<bar>sp<bar>bn<bar>bd<cr>
nmap <s-w> :BD<cr>
" Select All
nnoremap <c-a> ggVG

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

" Igbanam's Functions ---------------------------------------------------- {{{
" ===========
" Format JSON
" ===========
function! FormatJSON() range
  silent! execute a:firstline . "," . a:lastline . '!python -m json.tool'
endfunction

"Convert within visual selection
vnoremap <leader>pp :call FormatJSON()<cr>
"Convert entire file
nnoremap <leader>pp  :0,$call FormatJSON()<cr>
" ------------------------------------------------------------------------ }}}
