" Plugins

call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/popup.nvim' " Telescope dep
Plug 'nvim-lua/plenary.nvim' " Telescope dep
Plug 'nvim-telescope/telescope.nvim' " Find files
Plug 'gruvbox-community/gruvbox' " Colorscheme
Plug 'jiangmiao/auto-pairs' " Auto pair matching symbols
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Fancy highlights
Plug 'nvim-treesitter/playground' " Dependency
Plug 'puremourning/vimspector' " Debugger
Plug 'szw/vim-maximizer' " Maximize buffers
Plug 'rust-lang/rust.vim' " Rust language
Plug 'tweekmonster/gofmt.vim' " Golang
Plug 'tpope/vim-fugitive' " Git integration
Plug 'vim-utils/vim-man' " Manual for vim commands
Plug 'mbbill/undotree' " More complex undos
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy search
Plug 'junegunn/fzf.vim' " Fuzzy search in vim
Plug 'stsewd/fzf-checkout.vim' " Dependency
Plug 'tpope/vim-dispatch' " Launch commands from vim
Plug 'tpope/vim-vinegar' " File explorer
Plug 'dbeniamine/cheat.sh-vim' " Cheat sheet integration
Plug 'tpope/vim-projectionist' " Custom vim per project
Plug 'octol/vim-cpp-enhanced-highlight' " Better highlight for cpp
Plug 'rhysd/vim-grammarous' " Multi language grammer checker

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
nmap <leader>tj :call GotoBuffer(0)<CR>
nmap <leader>tk :call GotoBuffer(1)<CR>
nmap <leader>tl :call GotoBuffer(2)<CR>
nmap <leader>th :call GotoBuffer(3)<CR>

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
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
    command! W :w
    command! Q :q
augroup END
