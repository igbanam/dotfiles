vim9script

filetype plugin on

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
Plug 'jaredgorski/Mies.vim'
Plug '~/projects/igbanam/typewriter-vim'
Plug 'sainnhe/everforest'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
# ------------------------------------------------------------------------ }}}
# IDE Capabilities ------------------------------------------------------- {{{
Plug 'airblade/vim-gitgutter'
Plug 'asheq/close-buffers.vim'
Plug 'docunext/closetag.vim',           { 'for': ['html', 'xml'] }
Plug 'edgedb/edgedb-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'evanleck/vim-svelte',             { 'for': 'svelte' }
Plug 'fatih/vim-go',                    { 'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'github/copilot.vim'
Plug 'honza/vim-snippets',              { 'for': 'html' }
Plug 'igbanam/vim-startify'
Plug 'janko-m/vim-test'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'junegunn/fzf',                    { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim',               { 'for': 'markdown' }
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vader.vim'
Plug 'junegunn/vim-easy-align'
Plug 'pangloss/vim-javascript',         { 'for': 'javascript' }
Plug 'preservim/tagbar'
Plug 'pseewald/vim-anyfold'
Plug 'reedes/vim-pencil',               { 'for': 'markdown' }
Plug 'reedes/vim-wordy',                { 'for': 'markdown' }
Plug 'rhysd/vim-crystal',               { 'for': 'crystal' }
Plug 'rhysd/git-messenger.vim'
Plug 'romainl/vim-cool'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'slashmili/alchemist.vim',         { 'for': 'elixir' }
Plug 'thinca/vim-themis'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
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
Plug 'unisonweb/unison',                { 'branch': 'trunk', 'rtp': 'editor-support/vim' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-pandoc/vim-pandoc',           { 'for': 'markdown' }
Plug 'vim-pandoc/vim-pandoc-syntax',    { 'for': 'markdown' }
Plug 'vim-ruby/vim-ruby',               { 'for': 'ruby' }
Plug 'vim-scripts/vim-auto-save'
Plug 'wakatime/vim-wakatime'
Plug 'wellle/targets.vim'
Plug '~/projects/igbanam/bob.vim'

if v:version >= 800 || has('nvim')
  Plug 'dense-analysis/ale'
endif

if has("python") || has("python3")
  Plug 'SirVer/ultisnips'
  Plug 'puremourning/vimspector'
endif

if (has('patch-8.2.4608'))
  Plug 'igbanam/vim-notify'
  Plug 'neoclide/coc.nvim',               { 'branch': 'release' }
endif
# ------------------------------------------------------------------------ }}}
plug#end()

# Plug (vim-plug) -------------------------------------------------------- {{{
map <leader>plc :PlugClean<cr>
map <leader>pli :PlugInstall<cr>
map <leader>plu :PlugUpdate<cr>
# ------------------------------------------------------------------------ }}}
