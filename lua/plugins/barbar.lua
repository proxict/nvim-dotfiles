
return {
    'romgrk/barbar.nvim',
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
    dependencies = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
        vim.g.barbar_auto_setup = false

        vim.keymap.set('n', 'H', ':BufferPrevious<CR>', { noremap = false, silent = true, desc = "Prev buffer" })
        vim.keymap.set('n', 'L', ':BufferNext<CR>', { noremap = false, silent = true, desc = "Next buffer" })
        vim.keymap.set('n', '<A-h>', ':BufferMovePrevious<CR>', { noremap = false, silent = true, desc = "Move buffer left" })
        vim.keymap.set('n', '<A-l>', ':BufferMoveNext<CR>', { noremap = false, silent = true, desc = "Move buffer right" })
        vim.keymap.set('n', '<Leader>bd', ':BufferClose<CR>', { noremap = false, silent = true, desc = "Close buffer" })
    end,
    opts = {
        highlight_inactive_file_icons = true,
        icons = {
            diagnostics = {
                [vim.diagnostic.severity.ERROR] = {enabled = true},
                [vim.diagnostic.severity.WARN] = {enabled = true},
                [vim.diagnostic.severity.INFO] = {enabled = false},
                [vim.diagnostic.severity.HINT] = {enabled = true},
            },
        },
        gitsigns = {
            added = {enabled = true, icon = '+'},
            changed = {enabled = true, icon = '~'},
            deleted = {enabled = true, icon = '-'},
        },
    },
}
