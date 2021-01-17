" LSP config

lua << EOF
require'lspconfig'.bashls.setup{}
require'lspconfig'.ccls.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.yamlls.setup{}
require'lspconfig'.sqlls.setup{}
require'lspconfig'.pyright.setup{}
EOF
