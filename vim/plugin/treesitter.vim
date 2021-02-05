" Treesitter

set completeopt=menuone,noinsert,noselect " Do not auto fill auto completions

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