vim9script

filetype plugin on

# Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

# Descriptions ----------------------------------------------------------- {{{
# This file contains all the plugins I use for Vim + the configuration of the
# plugin manager I use: vim-plug.
#
# The differnt files in the folder goes on to configure the plugins which need
# configuration. There are three groups of files in this folder by prefix:
# - `for-...`: configures plugins based on use-cases (e.g. for-folding.vim)
# - `my-...`: which hold custom functions I write myself
# - `...`: configuring plugins directly (e.g. vim-airline.vim)
# ------------------------------------------------------------------------ }}}

plug#begin('~/.vim/bundle')
# Colors ----------------------------------------------------------------- {{{
Plug 'Alligator/accent.vim'
Plug 'sainnhe/everforest'
# ------------------------------------------------------------------------ }}}
# IDE Capabilities ------------------------------------------------------- {{{
Plug 'asheq/close-buffers.vim'
Plug 'dense-analysis/ale'
Plug 'docunext/closetag.vim',           { 'for': ['html', 'xml'] }
Plug 'editorconfig/editorconfig-vim'
Plug 'evanleck/vim-svelte',             { 'for': 'svelte' }
Plug 'fatih/vim-go',                    { 'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'honza/vim-snippets'
Plug 'igbanam/vim-startify'
Plug 'janko-m/vim-test'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'junegunn/fzf',                    { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim',               { 'for': 'markdown' }
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'ledger/vim-ledger'
Plug 'mikelue/vim-maven-plugin'
Plug 'neoclide/coc.nvim',               { 'branch': 'release' }
Plug 'pangloss/vim-javascript',         { 'for': 'javascript' }
Plug 'preservim/nerdtree'
Plug 'pseewald/vim-anyfold'
Plug 'reedes/vim-pencil',               { 'for': 'markdown' }
Plug 'reedes/vim-wordy',                { 'for': 'markdown' }
Plug 'rhysd/vim-crystal',               { 'for': 'crystal' }
Plug 'romainl/vim-cool'
Plug 'ryanoasis/vim-devicons'
# Plug 'sheerun/vim-polyglot'
Plug 'slashmili/alchemist.vim',         { 'for': 'elixir' }
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fireplace',             { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-pandoc/vim-pandoc',           { 'for': 'markdown' }
Plug 'vim-pandoc/vim-pandoc-syntax',    { 'for': 'markdown' }
Plug 'vim-ruby/vim-ruby',               { 'for': 'ruby' }
Plug 'vim-scripts/vim-auto-save'
Plug 'wakatime/vim-wakatime'
Plug 'wellle/targets.vim'
Plug '~/projects/igbanam/bob.vim'

if has("python") || has("python3")
  Plug 'SirVer/ultisnips'
  Plug 'puremourning/vimspector'
endif
# ------------------------------------------------------------------------ }}}
plug#end()

# Plug (vim-plug) -------------------------------------------------------- {{{
map <leader>plc :PlugClean<cr>
map <leader>pli :PlugInstall<cr>
map <leader>plu :PlugUpdate<cr>
# ------------------------------------------------------------------------ }}}
