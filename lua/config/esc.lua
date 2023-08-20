-- ESC in these filetypes will close them

-- Maybe not even needed with no-buflisted
function is_split_window()
    -- If the number of windows is more than 1, we're in a split
    return vim.fn.winnr('$') > 1
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'qf', 'help', 'man', 'NvimTree', 'preview', 'ale-preview', 'ale-preview.message', 'ale-preview-selection' },
    group   = vim.api.nvim_create_augroup('EscFileTypeQuit', {}),
    callback = function()
        vim.opt_local.buflisted = false
        vim.api.nvim_buf_set_keymap(0, 'n', '<Esc>',
            ':lua if is_split_window() then vim.api.nvim_win_close(0, false) end<CR>',
            { noremap = true, silent = true }
        )
    end
})
