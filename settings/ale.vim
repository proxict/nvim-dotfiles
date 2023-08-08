scriptencoding utf-8

let g:ale_c_build_dir_names = ['build', '.']
let g:ale_completion_enabled = 0

let g:ale_c_project_filenames = ['.git/HEAD', 'configure', 'Makefile', 'CMakeLists.txt', 'compile_flags.txt']
let g:ale_set_highlights = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_set_signs = 0
let g:ale_echo_cursor = 1
let g:ale_floating_preview = 0
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']
let g:ale_hover_to_preview = 1
let g:ale_use_neovim_diagnostics_api = 1
let g:ale_lint_delay = 1000

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

sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=
sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=
sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=
sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=
