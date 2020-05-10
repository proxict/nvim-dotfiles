scriptencoding utf-8

let g:ale_c_build_dir_names = ['build', '.']
let g:ale_completion_enabled = 0

let g:ale_open_list = 0
let g:ale_set_highlights = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_set_signs = 1
" let g:ale_sign_error = '✖'
let g:ale_sign_error = '•'
let g:ale_sign_offset = 1000000
let g:ale_echo_cursor = 1
let g:ale_sign_info = 'ℹ'
let g:ale_sign_warning = '⚠'

let g:ale_linters = {
      \ 'c': ['clangd'],
      \ 'cpp': ['clangd'],
      \ }

" A little hack to set the same bg color as SignColumn
let signColumnBgColor = GetHighlightTerm('SignColumn', 'ctermbg')
exe 'hi ALEErrorSign ctermbg=' . signColumnBgColor . ' ctermfg=DarkRed'
exe 'hi ALEWarningSign ctermbg=' . signColumnBgColor . ' ctermfg=208'

highlight ALEError ctermbg=DarkRed ctermfg=White
highlight ALEWarning ctermbg=208 ctermfg=White
