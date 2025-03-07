local CodeFormatGroup = vim.api.nvim_create_augroup('CodeFormat', {})
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'c', 'cpp' },
    group    = CodeFormatGroup,
    callback = function()
        vim.keymap.set('n', '<Leader>cf', vim.lsp.buf.format, { noremap = true, silent = true })
    end
})
