" Config

set exrc " Source local vimrc if needed
set relativenumber " Numbers centered around current line
set nu " Actual line number on current line
set nohlsearch " Remove highlight on search items once accepted
set hidden " Keep buffers unsaved somewhere in the background
set noerrorbells " No sound
set tabstop=4 softtabstop=4 " Tab length
set shiftwidth=4 " Shift on indent
set shiftround " Round to mod shiftwidth
set expandtab " Convert tabs as spaces
set smartindent " Indentation
set smartcase " Search becomes case sensitive if there is one capital letter
set noswapfile " No swap file for buffer
set nobackup " No backup for file
set undodir=~/.vim/undodir " Where to store undos
set undofile " Restore undos for desired file when opening
set undolevels=1000 " Increase undo levels
set history=700 " Increase history size
set inccommand=split
set incsearch " Highlight search results while searching
set scrolloff=8 " Start scrolling 8 lines before end
set noshowmode " Do not show the mode you're in
set completeopt=menuone,noinsert,noselect " Do not auto fill auto completions
set signcolumn=yes " Column where errors go is always here
set colorcolumn=80 " Set bar at 80 characters
set cmdheight=2 " More space for error messages
set updatetime=750 " Time to refresh the file with errors
set shortmess+=c " Not ultra long messages for errors
set mouse=a " Enable mouse
set lazyredraw " Speed up redraws
set fileformat=unix " Linux formats
set encoding=utf-8 fileencoding=utf-8 " For those of us with weird names
set cursorline " Highlight and bold current line
hi cursorline cterm=bold
set cursorcolumn " Show current column
