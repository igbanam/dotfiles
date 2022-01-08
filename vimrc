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

if &diff
  set diffopt+=vertical  " forcing figutive to diff using vertical splits
endif

set backspace=2        " backspace deletes like most programs in insert mode
set complete-=i        " do not parse included files in autocomplete
set expandtab          " convert tabs to spaces; KISS
set exrc               " project-specific vimrc
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
set textwidth=80       " so we can wrap text
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
  autocmd Syntax xml,html.erb,xhtml,html setlocal foldmethod=indent
augroup END
" ------------------------------------------------------------------------ }}}

" Writing for Quip ------------------------------------------------------- {{{
augroup writing_for_quip
  autocmd!
  autocmd Filetype markdown setlocal textwidth=120
augroup END
" ------------------------------------------------------------------------ }}}

" Spaces for specific file types ----------------------------------------- {{{
augroup IntentionalIndentations
  autocmd!
  autocmd Filetype php,java setlocal tabstop=4 expandtab shiftwidth=4
augroup END
" ------------------------------------------------------------------------ }}}

""" Plugins with Vim-Plug

call plug#begin('~/.vim/bundle')

" Colors ----------------------------------------------------------------- {{{

Plug 'dikiaap/minimalist'
Plug 'logico/typewriter-vim'
Plug 'ray-x/aurora'
Plug 'sainnhe/everforest'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" IDE Capabilities ------------------------------------------------------- }}}

Plug 'asheq/close-buffers.vim'
Plug 'docunext/closetag.vim'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'github/copilot.vim'
Plug 'igbanam/slim'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'mxw/vim-jsx'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'pbrisbin/vim-mkdir'
Plug 'preservim/tagbar'
Plug 'pseewald/vim-anyfold'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-wordy'
Plug 'rhysd/vim-crystal'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'skywind3000/asyncrun.vim'
Plug 'slashmili/alchemist.vim'
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
Plug 'vim-airline/vim-airline'      " that awesome statusbar
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/vim-auto-save'
Plug 'wellle/targets.vim'

if v:version >= 800 || has('nvim')
  Plug 'dense-analysis/ale'
endif

" Neovim Natives --------------------------------------------------------- }}}

if has('nvim')
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'nvim-telescope/telescope-github.nvim'
  Plug 'nvim-telescope/telescope.nvim'
endif

call plug#end()

""" Configurations

colorscheme typewriter-night

" Airline (vim-airline) -------------------------------------------------- {{{
let g:airline_theme = 'typewriter'
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])
" ------------------------------------------------------------------------ }}}

" AnyFold (vim-anyfold) -------------------------------------------------- {{{
autocmd Filetype php,ruby,javascriptreact,javascript,json,jsx AnyFoldActivate
" let g:anyfold_identify_comments=2 " fold comments w.r.t syntax also
let g:anyfold_fold_comments=1
" ------------------------------------------------------------------------ }}}

" Asyncrun (asyncrun) ---------------------------------------------------- {{{
let g:asyncrun_open = 8
let g:asyncrun_status = ''
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

" Coc (coc.nvim) --------------------------------------------------------- {{{
set shortmess+=c      " Don't give |ins-completion-menu| messages
set updatetime=300    " Diagnostic messages disappear faster

" For expanding decorations in Scala worksheets
nmap <leader>ws <Plug>(coc-metals-expand-decoration)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Navigating the diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev>)
nmap <silent> ]g <Plug>(coc-diagnostic-next>)

" Trigger Code Actions
nnoremap <leader>cl :<c-u>call CocActionAsync('codeLensAction')<cr>

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

let g:coc_global_extensions = [
      \ 'coc-java',
      \ 'coc-json',
      \ 'coc-phpactor',
      \ 'coc-tsserver',
      \ ]
" ------------------------------------------------------------------------ }}}

" Copilot (copilot.vim) -------------------------------------------------- {{{
let g:copilot_filetypes = {
      \ '*': v:false,
      \ 'php': v:true,
      \ 'python': v:true,
      \ 'ruby': v:true,
      \ }
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

" EditorConfig ----------------------------------------------------------- {{{
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
" ------------------------------------------------------------------------ }}}

" FZF (fzf) -------------------------------------------------------------- {{{
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

" if !has('nvim')
  nnoremap <c-p> :FZF<cr>
" endif
" ------------------------------------------------------------------------ }}}

" Himalaya (himalaya) ---------------------------------------------------- {{{
let g:himalaya_mailbox_picker = 'fzf'
" ------------------------------------------------------------------------ }}}

" FZF (fzf) -------------------------------------------------------------- {{{
let g:goyo_width = 100
let g:goyo_height = 40
let g:goyo_linenr = 1
" ------------------------------------------------------------------------ }}}

" Limelight (limelight) -------------------------------------------------- {{{
nmap <leader>ll :Limelight!!<cr>
" ------------------------------------------------------------------------ }}}

" Miscellaneous ---------------------------------------------------------- {{{
" ===========
" Format JSON
" ===========
command! GenerateTags !ctags -R .

function! FormatJSON() range
  silent! execute a:firstline . "," . a:lastline . '!python -m json.tool'
endfunction

" Convert within visual selection
vnoremap <leader>pp :call FormatJSON()<cr>

" Convert entire file
nnoremap <leader>pp  :0,$call FormatJSON()<cr>

" Bubble lines
nmap <leader>mu ddkP
nmap <leader>md ddp

" Bubble blocks
vmap <leader>mu xkP`[V`]
vmap <leader>md xp`[V`]

" Copy blocks to Mac clipboard
vmap <leader>cp "+y

augroup all_things_scala
  au!
  autocmd BufNewFile,BufRead *.sbt,*.sc set filetype=scala
augroup END

" Finger Motions
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>eo :e $MYVIMRC<cr>
nmap <leader>r  :redraw!<cr>
" ------------------------------------------------------------------------ }}}

" Pencil (vim-pencil) ---------------------------------------------------- {{{
augroup pencil
  autocmd!
  autocmd filetype markdown,mkd call pencil#init()
        " \ | call lexical#init()
        " \ | call litecorrect#init()
        \ | setl spell spl=en_us fdl=4 noru nonu nornu
        \ | setl fdo+=search
augroup END

let g:pencil#wrapModeDefault = 'soft'
let g:pencil#textwidth = 74
let g:pencil#joinspaces = 0
let g:pencil#cursorwrap = 1
let g:pencil#conceallevel = 3
let g:pencil#concealcursor = 'c'
let g:pencil#softDetectSample = 20
let g:pencil#softDetectThreshold = 130
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
" ------------------------------------------------------------------------ }}}

" NerdTree (nerdtree) ---------------------------------------------------- {{{
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-n> :NERDTreeToggle<cr>
" ------------------------------------------------------------------------ }}}

" Ruby (vim-ruby) -------------------------------------------------------- {{{
" ------------------------------------------------------------------------ }}}

" Slim (Slack + Vim) ----------------------------------------------------- {{{
command! Slack :call slim#StartSlack()
" ------------------------------------------------------------------------ }}}

" SuperTab (supertab) ---------------------------------------------------- {{{
let g:SuperTabDefaultCompletionType = "<c-n>"
" ------------------------------------------------------------------------ }}}

" Telescope (telescope.nvim) --------------------------------------------- {{{
if exists("loaded_telescope")
  " be sure to change this to Lua scripts sometime in the future
  " These Lua scripts would live in ~/config/nvim/lua/namescoped/component.lua
  " and can be added to a vimscript (either .vimrc, or init.vim) as
  "
  "   lua require('namescoped.component')
  "
  " I think this is a lot cleaner in the long run. But for now, jumbling lua
  " as heredoc strings in the vimrc would do.

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

" if has('nvim')
"   nnoremap <c-p> :Telescope find_files prompt_prefix=<cr>
" endif
" ------------------------------------------------------------------------ }}}

" Test (vim-test) -------------------------------------------------------- {{{
map <leader>t :TestFile<cr>
map <leader>s :TestNearest<cr>
map <leader>l :TestLast<cr>
map <leader>a :TestSuite<cr>

if has('nvim')
  let test#strategy = "asyncrun"
else
  let test#strategy = "vimterminal"
endif
" ------------------------------------------------------------------------ }}}
