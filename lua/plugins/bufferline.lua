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
                    local error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text
                    local warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text
                    local icon = level:match("error") and error_icon or warn_icon
                    return " " .. icon
                end,
            },
        })

        vim.keymap.set('n', 'H', ':BufferLineCyclePrev<CR>', {silent = true})
        vim.keymap.set('n', 'L', ':BufferLineCycleNext<CR>', {silent = true})
        vim.keymap.set('n', '<A-h>', ':BufferLineMovePrev<CR>', {silent = true})
        vim.keymap.set('n', '<A-l>', ':BufferLineMoveNext<CR>', {silent = true})
    end,
}
