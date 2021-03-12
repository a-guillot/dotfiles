" Telescope remaps

nnoremap <leader>ps <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep for > ') })<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fG <cmd>Telescope live_grep<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
