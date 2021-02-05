" Python3 configuration

let g:deoplete#enable_at_startup = 1

let g:SuperTabDefaultCompletionType = "<c-n>"
" Select completion without creating newline.
let g:SuperTabCrMapping = 1
" Use vimtex for latex completion.
call deoplete#custom#var('omni', 'input_patterns', {
    \ 'tex': g:vimtex#re#deoplete})

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

let g:neomake_python_enabled_makers = ['pylint']
call neomake#configure#automake('nrwi', 500)
