scriptencoding utf-8
set encoding=utf-8

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
set background=light

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

" colors
Plug 'dikiaap/minimalist'
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-one'
Plug 'rakr/vim-two-firewatch'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" plugins
Plug 'asheq/close-buffers.vim'
Plug 'chrisbra/Colorizer'
Plug 'docunext/closetag.vim'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'elixir-editors/vim-elixir'
Plug 'ervandew/supertab'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'leafgarland/typescript-vim'
Plug 'pbrisbin/vim-mkdir'
Plug 'slashmili/alchemist.vim'
Plug 'rhysd/vim-crystal'
Plug 'StanAngeloff/php.vim'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-heroku'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'      " that awesome statusbar
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/vim-auto-save'

if g:has_async
  Plug 'w0rp/ale'
endif

call plug#end()

""" Configurations

colorscheme onehalflight

" Airline (vim-airline) -------------------------------------------------- {{{
let g:airline_theme='atomic'
let g:airline#extensions#tabline#enabled = 1
" ------------------------------------------------------------------------ }}}

" Ale (ale) -------------------------------------------------------------- {{{
let g:ale_set_highlights = 0
let g:ale_linters = {
\  'elixir': ['credo'. 'dialyxir', 'dogma', 'mix'],
\}
" ------------------------------------------------------------------------ }}}

" Auto Save (vim-auto-save) ---------------------------------------------- {{{
let g:auto_save = 1  " enable autosave on vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
" ------------------------------------------------------------------------ }}}

" Buffers ---------------------------------------------------------------- {{{
set hidden
nnoremap [b :bprev<cr>
nnoremap ]b :bnext<cr>

" Closers
nmap <leader>w :CloseThisBuffer<cr>
nmap <leader>aw :CloseAllBuffers<cr>
nmap <leader>hw :CloseHiddenBuffers<cr>
" ------------------------------------------------------------------------ }}}

" Comments (vim-commentary) ---------------------------------------------- {{{
map  gc  <plug>Commentary
nmap gcc <plug>CommentaryLine
" ------------------------------------------------------------------------ }}}

" Discipline ------------------------------------------------------------- {{{
nnoremap <Left> :echoe "!!! Use h !!!"<CR>
nnoremap <Right> :echoe "!!! Use l !!!"<CR>
nnoremap <Up> :echoe "!!! Use k !!!"<CR>
nnoremap <Down> :echoe "!!! Use j !!!"<CR>
" ------------------------------------------------------------------------ }}}

" Fugitive (vim-fugitive) ------------------------------------------------ {{{
nmap <Leader>gho :Gbrowse <CR>
nmap <Leader>ghc :Gbrowse! <CR>
" ------------------------------------------------------------------------ }}}

" FZF (fzf) -------------------------------------------------------------- {{{
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

nnoremap <c-p> :FZF<cr>
" ------------------------------------------------------------------------ }}}

" Limelight (limelight) -------------------------------------------------- {{{
nmap <leader>ll :Limelight!!<cr>
" ------------------------------------------------------------------------ }}}

" Miscellaneous ---------------------------------------------------------- {{{
" Select All
nnoremap <c-a> ggVG

" Quicker Window Movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" My Config
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>eo :e $MYVIMRC<cr>
nmap <leader>r  :redraw!<cr>
" ------------------------------------------------------------------------ }}}

" Plug (vim-plug) -------------------------------------------------------- {{{
map <leader>plc :PlugClean<cr>
map <leader>pli :PlugInstall<cr>
map <leader>plu :PlugUpdate<cr>
" ------------------------------------------------------------------------ }}}

" Ruby (vim-ruby) -------------------------------------------------------- {{{
let ruby_fold = 1
" let ruby_foldable_groups = 'def do'
" ------------------------------------------------------------------------ }}}

" Test (vim-test) -------------------------------------------------------- {{{
map <leader>t :TestFile<CR>
map <leader>s :TestNearest<CR>
map <leader>l :TestLast<CR>
map <leader>a :TestSuite<CR>

let test#strategy = "basic"
" ------------------------------------------------------------------------ }}}

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
" Bubble lines
nmap <leader>mu ddkP
nmap <leader>md ddp
" Bubble blocks
vmap <leader>mu xkP`[V`]
vmap <leader>md xp`[V`]
" Copy blocks to Mac clipboard
vmap <leader>cp "+y
" ------------------------------------------------------------------------ }}}
