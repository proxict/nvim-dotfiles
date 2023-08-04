scriptencoding utf-8

let g:ale_c_build_dir_names = ['build', '.']
let g:ale_completion_enabled = 0

let g:ale_c_project_filenames = ['.git/HEAD', 'configure', 'Makefile', 'CMakeLists.txt', 'compile_flags.txt']
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
      \ 'rust': ['analyzer'],
      \ }

let g:ale_python_flake8_options = '--ignore=E501'

" A little hack to set the same bg color as SignColumn
call CopyHighlightArgs('SignColumn', 'ALEErrorSign', 'ctermbg')
call CopyHighlightArgs('SignColumn', 'ALEWarningSign', 'ctermbg')

highlight ALEErrorSign ctermfg=DarkRed
highlight ALEWarningSign ctermfg=208
highlight ALEError ctermbg=DarkRed ctermfg=White
highlight ALEWarning ctermbg=208 ctermfg=White
