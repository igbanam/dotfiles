vim9script

scriptencoding utf-8
set encoding=utf-8

# leader
var mapleader = " "

# switch syntax highlighting on, when the terminal has colors
# also switch on highlighting the last used search pattern.
if (str2nr(&t_Co) > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

# When the file is large, we have some performance issues.
# I define a large file as a file with more than 1000 lines
# For these files, I have realized using the old regexengine
# serves me better
if line('$') > 1000
  set re=1
endif

set t_8f="\<Esc>[38;2;%lu;%lu;%lum"
set t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

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

# display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

# Spaces for specific file types ----------------------------------------- {{{
augroup IntentionalIndentations
  autocmd!
  autocmd Filetype php,java setlocal tabstop=4 expandtab shiftwidth=4
augroup END
# ------------------------------------------------------------------------ }}}

call plug#begin('~/.vim/bundle')

# Colors ----------------------------------------------------------------- {{{
Plug 'dikiaap/minimalist'
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'logico/typewriter-vim'
Plug 'sainnhe/everforest'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'rktjmp/lush.nvim'
Plug 'rktjmp/shipwright.nvim'
# ------------------------------------------------------------------------ }}}

# IDE Capabilities ------------------------------------------------------- {{{
Plug 'asheq/close-buffers.vim'
Plug 'docunext/closetag.vim',           { 'for': ['html', 'xml'] }
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'evanleck/vim-svelte',             { 'for': 'svelte' }
Plug 'fatih/vim-go',                    { 'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'github/copilot.vim'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf',                    { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim',               { 'for': 'markdown' }
Plug 'junegunn/limelight.vim'
Plug 'neoclide/coc.nvim',               { 'branch': 'release' }
Plug 'pangloss/vim-javascript',         { 'for': 'javascript' }
Plug 'pbrisbin/vim-mkdir'
Plug 'preservim/tagbar'
Plug 'pseewald/vim-anyfold'
Plug 'reedes/vim-pencil',               { 'for': 'markdown' }
Plug 'reedes/vim-wordy',                { 'for': 'markdown' }
Plug 'rhysd/vim-crystal',               { 'for': 'crystal' }
Plug 'romainl/vim-cool'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'skywind3000/asyncrun.vim'
Plug 'slashmili/alchemist.vim',         { 'for': 'elixir' }
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
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
# Plug 'feline-nvim/feline.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-pandoc/vim-pandoc',           { 'for': 'markdown' }
Plug 'vim-pandoc/vim-pandoc-syntax',    { 'for': 'markdown' }
Plug 'vim-ruby/vim-ruby',               { 'for': 'ruby' }
Plug 'vim-scripts/vim-auto-save'
Plug 'wellle/targets.vim'

if v:version >= 800 || has('nvim')
  Plug 'dense-analysis/ale'
endif
# ------------------------------------------------------------------------ }}}

# Neovim Natives --------------------------------------------------------- {{{
if has('nvim')
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'nvim-telescope/telescope-github.nvim'
  Plug 'nvim-telescope/telescope.nvim'
endif
# ------------------------------------------------------------------------ }}}

call plug#end()

colorscheme embark

# Airline (vim-airline) -------------------------------------------------- {{{
g:airline_theme = 'everforest'
g:airline#extensions#tabline#enabled = 1
g:airline_powerline_fonts = 1
# lua <<FELINE
# local feline_components = {
#   active = {},
#   inactive = {}
# }
# require('feline').setup()
# FELINE
# ------------------------------------------------------------------------ }}}

# Asyncrun (asyncrun) ---------------------------------------------------- {{{
g:asyncrun_open = 8
g:asyncrun_status = ''
# ------------------------------------------------------------------------ }}}

# Auto Save (vim-auto-save) ---------------------------------------------- {{{
g:auto_save = 1                 # enable autosave on vim startup
g:auto_save_in_insert_mode = 0  # do not save while in insert mode
# ------------------------------------------------------------------------ }}}

# Buffers ---------------------------------------------------------------- {{{
set hidden

# Closers (close-buffers)
nmap <leader>w :Bdelete this<cr>
nmap <leader>aw :Bdelete all<cr>
nmap <leader>hw :Bdelete hidden<cr>

# Quicker Window Movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
# ------------------------------------------------------------------------ }}}

# Comments (vim-commentary) ---------------------------------------------- {{{
map  gc  <plug>Commentary
nmap gcc <plug>CommentaryLine
# ------------------------------------------------------------------------ }}}

# Discipline ------------------------------------------------------------- {{{
nnoremap <left>  :echoe "!!! Use h !!!"<cr>
nnoremap <right> :echoe "!!! Use l !!!"<cr>
nnoremap <up>    :echoe "!!! Use k !!!"<cr>
nnoremap <down>  :echoe "!!! Use j !!!"<cr>
# ------------------------------------------------------------------------ }}}

# Embark (embark-theme) -------------------------------------------------- {{{
g:embark_terminal_italics = 1
# ------------------------------------------------------------------------ }}}

# File Navigation (fzf, fzf.vim, nerdtree, telescope.nvim) --------------- {{{
# FZF
$FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
nnoremap <c-p> :FZF<cr>

# NERDTree
g:NERDTreeDirArrowExpandable = '▸'
g:NERDTreeDirArrowCollapsible = '▾'
map <C-n> :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>

# Telescope
if exists("loaded_telescope")
lua <<TELESCOPE_CONFIG
require('telescope').setup{
  defaults = {
  },
  pickers = {
    find_files = {
      find_command = { "ag", "--hidden", "--ignore", ".git", "-l", "-g", "" },
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = smart_case,
    }
  }
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('gh')
TELESCOPE_CONFIG
endif
# ------------------------------------------------------------------------ }}}

# Folding (vim-anyfold) -------------------------------------------------- {{{
augroup fold_schemes
  autocmd!
  autocmd Filetype crystal setlocal foldmethod=syntax
  autocmd Filetype php,ruby,json AnyFoldActivate
  autocmd Filetype vim set foldmethod=marker
  autocmd Syntax xml,html.erb,xhtml,html setlocal foldmethod=indent
augroup END

g:anyfold_fold_comments = 1
# ------------------------------------------------------------------------ }}}

# Intellisense (coc.nvim, copilot.vim, ale) ------------------------------ {{{
set shortmess+=c      # Don't give |ins-completion-menu| messages
set updatetime=300    # Diagnostic messages disappear faster

# For expanding decorations in Scala worksheets
nmap <leader>ws <Plug>(coc-metals-expand-decoration)

# Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

# Navigating the diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev>)
nmap <silent> ]g <Plug>(coc-diagnostic-next>)

# Trigger Code Actions
nnoremap <leader>cl :<c-u>call CocActionAsync('codeLensAction')<cr>

# Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

g:coc_global_extensions = [
      \ 'coc-java',
      \ 'coc-json',
      \ 'coc-phpactor',
      \ 'coc-tsserver',
      \ ]

# Copilot
g:copilot_filetypes = {
      \ '*': v:false,
      \ 'php': v:true,
      \ 'python': v:true,
      \ 'ruby': v:true,
      \ }

# Ale
g:ale_set_highlights = 1
g:ale_linters_explicit = 1
g:ale_linters = {
\  'elixir': ['credo', 'dialyxir', 'dogma', 'mix'],
\  'ruby': ['ruby', 'rails_best_practices']
\}
# ------------------------------------------------------------------------ }}}

# Limelight (limelight) -------------------------------------------------- {{{
nmap <leader>ll :Limelight!!<cr>
# ------------------------------------------------------------------------ }}}

# Miscellaneous ---------------------------------------------------------- {{{
command! GenerateTags !ctags -R .

# ===========
# Format JSON
# ===========
function! FormatJSON() range
  silent! execute a:firstline . "," . a:lastline . '!python -m json.tool'
endfunction

# Convert within visual selection
vnoremap <leader>pp :call FormatJSON()<cr>

# Convert entire file
nnoremap <leader>pp  :0,$call FormatJSON()<cr>

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

# PHP (php) -------------------------------------------------------------- {{{
var php_folding = 1
# ------------------------------------------------------------------------ }}}

# Plug (vim-plug) -------------------------------------------------------- {{{
map <leader>plc :PlugClean<cr>
map <leader>pli :PlugInstall<cr>
map <leader>plu :PlugUpdate<cr>
# ------------------------------------------------------------------------ }}}

# Projects (vim-projectionist, editorconfig-vim) ------------------------- {{{
g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

g:projectionist_heuristics = {
      \ "Poet": {
      \   "*.txt": {
      \     "type": "note",
      \     "template": "title: {basename|capitalize}\ntags:\n\n"
      \   },
      \ },
      \ "Cargo.toml": {
      \   "*": {
      \     "make": "cargo",
      \   },
      \ },
      \ ".hanamirc": {
      \   "*": {
      \     "start": "hanami server",
      \     "console": "hanami console",
      \   },
      \ },
      \ "*.gemspec|.hanamirc": {
      \   "spec/*_spec.rb": {
      \     "alternate": "lib/{}.rb",
      \     "command": "spec"
      \   },
      \   "lib/*.rb": { "alternate": "spec/{}_spec.rb" }
      \ },
      \ "shard.yml": {
      \   "src/*.cr": {
      \     "type": "source",
      \     "alternate": "spec/{}_spec.cr"
      \   },
      \   "spec/*_spec.cr": {
      \     "type": "test",
      \     "alternate": "src/{}.cr"
      \   },
      \   "*": {
      \     "make": "shards build --no-color",
      \   }
      \ },
      \ "package.json": {
      \   "*": {
      \     "start": "yarn start",
      \     "make": "yarn build",
      \   },
      \ },
      \ "composer.json": {
      \   "*": {
      \     "start": "composer serve",
      \     "make": "composer update",
      \   },
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
      \ },
      \ }
# ------------------------------------------------------------------------ }}}

# Ruby (vim-ruby) -------------------------------------------------------- {{{
# ------------------------------------------------------------------------ }}}

# Rails (vim-rails) ------------------------------------------------------ {{{
command AC :execute "e " . eval('rails#buffer().alternate()')
# ------------------------------------------------------------------------ }}}

# SuperTab (supertab) ---------------------------------------------------- {{{
g:SuperTabDefaultCompletionType = "<c-n>"
# ------------------------------------------------------------------------ }}}

# Test (vim-test) -------------------------------------------------------- {{{
map <leader>t :TestFile<cr>
map <leader>s :TestNearest<cr>
map <leader>l :TestLast<cr>
map <leader>a :TestSuite<cr>

if exists('$TMUX')
  var test#strategy = "dispatch"
elseif has('nvim')
  var test#strategy = "asyncrun"
else
  var test#strategy = "vimterminal"
endif
# ------------------------------------------------------------------------ }}}

# Writing (vim-pandoc[-syntax], vim-pencil, goyo.vim) -------------------- {{{
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
        \ | nnoremap <buffer> <leader>mg :<c-u>call GraphThis()<cr>
augroup END
# ------------------------------------------------------------------------ }}}
