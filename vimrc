scriptencoding utf-8
set encoding=utf-8

set nocompatible       " let's wean ourselves from Vi

" leader
let mapleader = " "

" switch syntax highlighting on, when the terminal has colors
" also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" When the file is large, we have some performance issues.
" I define a large file as a file with more than 1000 lines
" For these files, I have realized using the old regexengine
" serves me better
if line('$') > 1000
  set re=1
endif

set backspace=2        " backspace deletes like most programs in insert mode
set complete-=i        " do not parse included files in autocomplete
set diffopt+=vertical  " forcing figutive to diff using vertical splits
set expandtab          " convert tabs to spaces; KISS
set history=50         " increase how many entries we can keep in the history
set incsearch          " do incremental searching
set laststatus=2       " always display the status line
set noautowrite        " handled by vim-auto-save
set nobackup           " I don't like them .swp files; I already have Git
set nocursorcolumn
set nocursorline
set norelativenumber   " Cool +/- relative to the cursor; but heavy for large files
set noswapfile         " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set nowritebackup      " Still on them .swp files; don't need them
set number             " numbers
set numberwidth=5      " How big do you want your gutter to the left?
set ruler              " show the cursor position all the time
set shiftround         " Round the indentation to the nearest shiftwidth
set shiftwidth=2       " How big should our shifts/tabs be?
set showcmd            " display incomplete commands
set splitright         " open a new split in the more natural position
set tabstop=2          " softtabs, 2 spaces
set thesaurus=/Users/igbanam/.vim/thesaurus.txt

" display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Smart Toggling -------------------------------------------------------- {{{
"
" When working in a file, I would like to jump around quickly based on the
" relative position of the line from the cursor. When reading a file in an
" inactive buffer, I would like to say the exact line number I am referring to
" since the cursor would not be in that buffer.

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * if line("$") < 1000 | set relativenumber | endif
    autocmd BufEnter,FocusGained,InsertLeave * if line("$") > 1000 | set norelativenumber | endif
    autocmd BufLeave,FocusLost,InsertEnter * if line("$") < 1000 | set norelativenumber | endif
augroup END

" ------------------------------------------------------------------------ }}}

" How to Fold ------------------------------------------------------------ {{{
augroup fold_schemes
  autocmd!
  autocmd Filetype crystal setlocal foldmethod=syntax
  autocmd Syntax xml,html.erb,xhtml setlocal foldmethod=indent
augroup END
" ------------------------------------------------------------------------ }}}

""" Plugins with Vim-Plug

call plug#begin('~/.vim/bundle')

" Colors ----------------------------------------------------------------- {{{
"
" These are colots I like using in vim. It should be minimalist for when the
" terminal is in dark mode, and onehalf-light for when the term is white.

Plug 'dikiaap/minimalist'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" ------------------------------------------------------------------------ }}}

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
Plug 'junegunn/gv.vim'
Plug 'junegunn/limelight.vim'
Plug 'leafgarland/typescript-vim'
Plug 'majutsushi/tagbar'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'pbrisbin/vim-mkdir'
Plug 'scrooloose/nerdtree'
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
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'      " that awesome statusbar
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/vim-auto-save'

if v:version >= 800 || has('nvim')
  Plug 'dense-analysis/ale'
endif

call plug#end()

""" Configurations

colorscheme minimalist

" Airline (vim-airline) -------------------------------------------------- {{{
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled = 1
" ------------------------------------------------------------------------ }}}

" Ale (ale) -------------------------------------------------------------- {{{
let g:ale_set_highlights = 0
let g:ale_linters = {
\  'elixir': ['credo'. 'dialyxir', 'dogma', 'mix'],
\}
" ------------------------------------------------------------------------ }}}

" Auto Save (vim-auto-save) ---------------------------------------------- {{{
let g:auto_save = 1                 " enable autosave on vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
" ------------------------------------------------------------------------ }}}

" Buffers ---------------------------------------------------------------- {{{
set hidden

" Closers (close-buffers)
nmap <leader>w :Bdelete this<cr>
nmap <leader>aw :Bdelete all<cr>
nmap <leader>hw :Bdelete hidden<cr>

" Quicker Window Movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" ------------------------------------------------------------------------ }}}

" Comments (vim-commentary) ---------------------------------------------- {{{
map  gc  <plug>Commentary
nmap gcc <plug>CommentaryLine
" ------------------------------------------------------------------------ }}}

" Discipline ------------------------------------------------------------- {{{
nnoremap <left>  :echoe "!!! Use h !!!"<cr>
nnoremap <right> :echoe "!!! Use l !!!"<cr>
nnoremap <up>    :echoe "!!! Use k !!!"<cr>
nnoremap <down>  :echoe "!!! Use j !!!"<cr>
" ------------------------------------------------------------------------ }}}

" Fugitive (vim-fugitive) ------------------------------------------------ {{{
nmap <Leader>gho :Gbrowse <cr>
nmap <Leader>ghc :Gbrowse! <cr>
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

" Finger Motions
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>eo :e $MYVIMRC<cr>
nmap <leader>r  :redraw!<cr>
" ------------------------------------------------------------------------ }}}


" PHP (php) -------------------------------------------------------------- {{{
let php_folding = 1
" ------------------------------------------------------------------------ }}}

" Plug (vim-plug) -------------------------------------------------------- {{{
map <leader>plc :PlugClean<cr>
map <leader>pli :PlugInstall<cr>
map <leader>plu :PlugUpdate<cr>
" ------------------------------------------------------------------------ }}}

" Projectionist (vim-projectionist) -------------------------------------- {{{
"
" This is a living mapping document for different projects I work on. Since
" there is no way to comment within the VimScript, I will list the projects
" supported by these heuristics in the order they appear top-level
"
" PROJECTS
" - A Ruby Gem
let g:projectionist_heuristics = {
      \ "*.gemspec|.hanamirc": {
      \   "spec/*_spec.rb": {
      \     "alternate": "lib/{}.rb",
      \     "command": "spec"
      \   },
      \   "lib/*.rb": { "alternate": "spec/{}_spec.rb" }
      \ },
      \ "build.gradle": {
      \   "src/main/java/*.java": {
      \     "alternate": "src/test/java/{}Tests.java",
      \   },
      \   "src/test/java/*Tests.java": {
      \     "alternate": "src/main/java/{}.java",
      \     "command": "spec"
      \   },
      \ },
      \ "Gemfile": {
      \   "app/serializers/*_serializer.rb": {
      \     "command": "serializer",
      \     "affinity": "model",
      \     "test": "spec/serializers/{}_spec.rb",
      \     "related": "app/models/{}.rb",
      \     "template": "class {camelcase|capitalize|colons}Serializer < ActiveModel::Serializer\nend"
      \   }
      \ }}
" ------------------------------------------------------------------------ }}}

" NerdTree (nerdtree) ---------------------------------------------------- {{{
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-n> :NERDTreeToggle<cr>
" ------------------------------------------------------------------------ }}}

" Ruby (vim-ruby) -------------------------------------------------------- {{{
let ruby_fold = 1
" let ruby_foldable_groups = 'def do'
" ------------------------------------------------------------------------ }}}

" Test (vim-test) -------------------------------------------------------- {{{
map <leader>t :TestFile<cr>
map <leader>s :TestNearest<cr>
map <leader>l :TestLast<cr>
map <leader>a :TestSuite<cr>

if has('nvim')
  let test#strategy = "neovim"
else
  let test#strategy = "vimterminal"
endif
" ------------------------------------------------------------------------ }}}

" Igbanam's Functions ---------------------------------------------------- {{{
" ===========
" Format JSON
" ===========
command! GenerateTags !ctags -R .

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

" Per Project Setup ------------------------------------------------------ {{{
function! SetupLocalEnvironment()
  let l:root_directory = expand('%:p')
  if l:root_directory =~ '/github/github'
    " GitHub-specific configuration
  endif
endfunction

" Run this everytime we read a buffer - may not be as performant
autocmd! vimenter,BufReadPost,BufNewFile * call SetupLocalEnvironment()

" Another way to do this would be
" 
"   augroup ProjectSetup
"     au vimenter,BufRead,BufEnter /path/to/a/project/* set syntax=off
"   augroup END
" ------------------------------------------------------------------------ }}}
