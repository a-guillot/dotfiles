" Plugins

call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/popup.nvim' " Telescope dep
Plug 'vim-airline/vim-airline' " Vim status bar
Plug 'nvim-lua/plenary.nvim' " Telescope dep
Plug 'nvim-telescope/telescope.nvim' " Find files
Plug 'gruvbox-community/gruvbox' " Colorscheme
Plug 'jiangmiao/auto-pairs' " Auto pair matching symbols
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
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
Plug 'neovim/nvim-lspconfig' " Language syntax
Plug 'lervag/vimtex' " for latex
Plug 'bling/vim-bufferline'
Plug 'neomake/neomake'
Plug 'tmhedberg/SimpylFold'
Plug 'theprimeagen/harpoon'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'tpope/vim-commentary'

" Python3 configuration
" Plug 'Shougo/deoplete.nvim'
Plug 'numirias/semshi'
Plug 'vimjas/vim-python-pep8-indent'

call plug#end()

colorscheme gruvbox " Change to decent colorscheme

" Python tests
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/andreas/.random/repos/github.com/Shougo/dein.vim

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" Required:
filetype plugin indent on
syntax enable

autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
autocmd CompleteDone * pclose " To close preview window of deoplete automagically




" Custom variables

nnoremap <space> <nop>
let mapleader=" " " Space as leader key
"lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" Remaps
" First letter: mode changed
" 'nore': no recursive remaps to avoid madness
" map: map left-hand side to right-hand side

nnoremap <leader>u :UndotreeShow<CR>

" Copy into system clip
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Moving around 3 terminals
"lua require("andreas")
"nmap <leader>tj :call Harpoon_GotoTerminal(1)<CR>
"nmap <leader>tk :call Harpoon_GotoTerminal(2)<CR>
"nmap <leader>tl :call Harpoon_GotoTerminal(3)<CR>
nmap <leader>a :tabprev<CR>
nmap <leader>s :tabnext<CR>

" Properly move on wrapped lines
vnoremap <up> gk
nnoremap <up> gk
vnoremap <down> gj
nnoremap <down> gj

" Spell check
inoremap <F10> <C-O>:GrammarousCheck<CR>
nnoremap <F10> :GrammarousCheck<CR>
inoremap <F11> <C-O>:GrammarousCheck --lang='fr'<CR>
nnoremap <F11> :GrammarousCheck --lang='fr'<CR>
inoremap <F12> <C-O>:GrammarousReset<CR>
nnoremap <F12> :GrammarousReset<CR>

" Abbreviations
abbr st section
abbr sst subsection
abbr ssst subsubsection

" Auto commands

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup ANDREAS
    autocmd!
    command! W :w
    command! Q :q
    " autocmd VimEnter * :call Harpoon_SetTerminal(1) | :call Harpoon_GotoTerminal(2) | :call Harpoon_GotoTerminal(1)
    autocmd BufWritePre * :call TrimWhitespace()
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END
