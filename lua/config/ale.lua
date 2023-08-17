vim.g['ale_c_build_dir_names'] = { 'build', '.' }
vim.g['ale_completion_enabled'] = false

vim.g['ale_c_project_filenames'] = { '.git/HEAD', 'configure', 'Makefile', 'CMakeLists.txt', 'compile_flags.txt' }
vim.g['ale_set_highlights'] = false
vim.g['ale_set_loclist'] = true
vim.g['ale_set_quickfix'] = false
vim.g['ale_set_signs'] = false
vim.g['ale_echo_cursor'] = true
vim.g['ale_floating_preview'] = false
vim.g['ale_floating_window_border'] = { '│', '─', '╭', '╮', '╯', '╰' }
vim.g['ale_hover_to_preview'] = true
vim.g['ale_use_neovim_diagnostics_api'] = true
vim.g['ale_lint_delay'] = 1000

vim.g['ale_linters'] = {
    c = {'clangd'},
    cpp = {'clangd'},
    rust = {'analyzer'},
}

vim.cmd([[
let g:ale_pattern_options = {
\   '.*/.cargo/.*': {'ale_enabled': 0},
\   '.*/.rustup/.*': {'ale_enabled': 0},
\}
]])

vim.g['ale_python_flake8_options'] = '--ignore=E501'

vim.fn.sign_define("DiagnosticSignError",  {text = '', texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",   {text = '',  texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",   {text = '',  texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",   {text = '',  texthl = "DiagnosticSignHint"})

vim.keymap.set('n', '<Leader>gd', ':ALEGoToDefinition<CR>', { silent = true })
vim.keymap.set('n', '<Leader>i', ':ALEDetail<CR>', { silent = true })
vim.keymap.set('n', '<Leader>r', ':ALEFindReferences<CR>', { silent = true })
vim.keymap.set('n', '<Leader>w', ':ALEHover<CR>', { silent = true })
vim.keymap.set('n', '<Leader>e', ':lopen<CR>', { silent = true })
