require("nvim-tree").setup({
    hijack_cursor = true,
    on_attach = function(bufnr)
        local api = require('nvim-tree.api')
        local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
        vim.keymap.del('n', 'bd', { buffer = bufnr })
        vim.keymap.del('n', 'bmv', { buffer = bufnr })
        vim.keymap.set('n', '<C-h>', api.tree.toggle_hidden_filter, opts('Toggle Filter: Dotfiles'))
        vim.keymap.set('n', 'H', '<C-w>w:BufferLineCyclePrev<CR><C-w>w', opts('Previous buffer'))
        vim.keymap.set('n', 'L', '<C-w>w:BufferLineCycleNext<CR><C-w>w', opts('Next buffer'))
    end,
    disable_netrw = true,
    sort_by = "name",
    view = {
        centralize_selection = true,
        width = 35,
        number = false,
    },
    renderer = {
        group_empty = true,
        add_trailing = false,
        highlight_git = true,
        full_name = false,
        highlight_opened_files = 'none',
        root_folder_label = ":t",
        indent_width = 2,
        indent_markers = {
          enable = false,
          inline_arrows = true,
        },
        icons = {
            webdev_colors = true,
            git_placement = "before",
            modified_placement = "after",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
                modified = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                bookmark = "󰆤",
                modified = "●",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
        special_files = {}, -- files listed here will be highlighted
        symlink_destination = true,
    },
    filters = {
        dotfiles = false,
        git_ignored = true,
        custom = { '^.git$', '^.gitmodules$' },
        exclude = { 'build', 'build_dir' },
    },
    git = {
        timeout = 2000,
    },
})

vim.keymap.set('n', '<Leader>f', ':NvimTreeToggle<CR>', { silent = true })
