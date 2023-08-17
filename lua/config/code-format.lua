local CodeFormatGroup = vim.api.nvim_create_augroup('CodeFormat', {})
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'c', 'cpp' },
    group    = CodeFormatGroup,
    callback = function()
        local buf_index = vim.api.nvim_get_current_buf()
        vim.api.nvim_buf_set_keymap(buf_index, 'n', '<Leader>cf', ':ClangFormat<CR>', { noremap = true, silent = true })
    end
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'rust' },
    group    = CodeFormatGroup,
    callback = function()
        local buf_index = vim.api.nvim_get_current_buf()
        vim.api.nvim_buf_set_keymap(buf_index, 'n', '<Leader>cf', ':Rustfmt<CR>', { noremap = true, silent = true })
    end
})

