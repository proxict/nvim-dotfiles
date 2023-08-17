require("nvim-tree").setup({
    disable_netrw = true,
    sort_by = "name",
    view = {
        width = 35,
        number = false,
    },
    renderer = {
        group_empty = true,
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
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
        symlink_destination = true,
    },
    filters = {
        dotfiles = false,
        git_ignored = true,
        custom = { '.git', '.gitmodules' },
        exclude = { 'build', 'compile_flags.txt', 'compile_commands.json' },
    },
})

vim.keymap.set('n', '<Leader>f', ':NvimTreeToggle<CR>', { silent = true })
