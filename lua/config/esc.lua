-- ESC in these filetypes will close them
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'qf', 'help', 'man', 'NvimTree', 'preview', 'ale-preview', 'ale-preview.message', 'ale-preview-selection' },
    group    = vim.api.nvim_create_augroup('EscFileTypeQuit', {}),
    callback = function()
        local buf_index = vim.api.nvim_get_current_buf()
        vim.api.nvim_buf_set_keymap(buf_index, 'n', '<Esc>', ':quit<CR>', { noremap = true, silent = true })
    end
})
