return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup({
            options = {
                offsets = {{filetype = "NvimTree", text = "File Explorer", highlight = "Directory"}},
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local error_icon = vim.diagnostic.config().signs.text[vim.diagnostic.severity.ERROR]
                    local warn_icon = vim.diagnostic.config().signs.text[vim.diagnostic.severity.WARN]
                    local icon = level:match("error") and error_icon or warn_icon
                    return " " .. icon
                end,
                custom_filter = function(buf_number, buf_numbers)
                    -- filter out terminal buffer type
                    if vim.bo[buf_number].buftype ~= "terminal" then
                        return true
                    end
                    return false
                end,
            },
        })

        vim.keymap.set('n', 'H', ':BufferLineCyclePrev<CR>', {silent = true})
        vim.keymap.set('n', 'L', ':BufferLineCycleNext<CR>', {silent = true})
        vim.keymap.set('n', '<A-h>', ':BufferLineMovePrev<CR>', {silent = true})
        vim.keymap.set('n', '<A-l>', ':BufferLineMoveNext<CR>', {silent = true})
    end,
}
