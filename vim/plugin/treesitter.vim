" Treesitter

set completeopt=menuone,noinsert,noselect " Do not auto fill auto completions
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  }
}
EOF
