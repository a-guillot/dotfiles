" Plugins

call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/popup.nvim' " Telescope dep
Plug 'nvim-lua/plenary.nvim' " Telescope dep
Plug 'nvim-telescope/telescope.nvim' " Find files
Plug 'gruvbox-community/gruvbox' " Colorscheme
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'rust-lang/rust.vim'
Plug 'tweekmonster/gofmt.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-dispatch'
Plug 'ThePrimeagen/harpoon'
Plug 'tpope/vim-vinegar'
Plug 'dbeniamine/cheat.sh-vim'

call plug#end()

colorscheme gruvbox " Change to decent colorscheme


" Custom variables

nnoremap <space> <nop>
let mapleader=" " " Space as leader key
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" Remaps
" First letter: mode changed
" 'nore': no recursive remaps to avoid madness
" map: map left-hand side to right-hand side

nnoremap <leader>u :UndotreeShow<CR>

" Copy into system clip
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Moving around 4 terminals
" XXX

" Properly move on wrapped lines
vnoremap <up> gk
nnoremap <up> gk
vnoremap <down> gj
nnoremap <down> gj


" Auto commands

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup ANDREAS
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
