" LSP config

lua << EOF
local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'

require'lspconfig'.bashls.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.yamlls.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.svelte.setup{}
require'lspconfig'.sqlls.setup{
    cmd = {'sql-language-server', 'up', '--method', 'stdio'};
}
require'lspconfig'.ccls.setup{
init_options = {
    compilationDatabaseDirectory = "build";
    index = {
    threads = 0;
    };
    clang = {
        excludeArgs = { '-frounding-math' };
    };
}
}
EOF
