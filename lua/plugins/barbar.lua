
return {
    'romgrk/barbar.nvim',
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
    dependencies = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
        vim.g.barbar_auto_setup = false

        opts = { noremap = false, silent = true }

        vim.keymap.set('n', 'H', ':BufferPrevious<CR>', opts)
        vim.keymap.set('n', 'L', ':BufferNext<CR>', opts)
        vim.keymap.set('n', '<A-h>', ':BufferMovePrevious<CR>', opts)
        vim.keymap.set('n', '<A-l>', ':BufferMoveNext<CR>', opts)
        vim.keymap.set('n', '<Leader>bd', ':BufferClose<CR>', opts)

        vim.keymap.set('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
        vim.keymap.set('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
        vim.keymap.set('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
        vim.keymap.set('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
        vim.keymap.set('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
        vim.keymap.set('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
        vim.keymap.set('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
        vim.keymap.set('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
        vim.keymap.set('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
        vim.keymap.set('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
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
