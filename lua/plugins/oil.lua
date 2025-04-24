return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    keys = {
        { "<Leader>F", "<cmd>Oil<CR>", desc = "Oil File Browser", noremap = true, silent = true },
    },
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function()
        require("oil").setup({
            use_default_keymaps = false,
            keymaps = {
                ["?"] = { "actions.show_help", mode = "n" },
                ["<C-c>"] = { "actions.close", mode = "n" },
                ["Q"] = { "actions.close", mode = "n" },
                ["<Esc><Esc>"] = { "actions.close", mode = "n" },
                ["<Leader>F"] = { "actions.close", mode = "n" },

                -- Enter a directory/open file
                ["<CR>"] = "actions.select",
                ["<C-s>"] = { "actions.select", opts = { vertical = true } }, -- open in a vertical split
                ["<C-l>"] = "actions.select",
                ["L"] = "actions.select",

                ["<Tab>"] = { "actions.preview", mode = "n" },
                ["<F5>"] = "actions.refresh",

                -- Go up a directory
                ["<C-h>"] = { "actions.parent", mode = "n" },
                ["H"] = { "actions.parent", mode = "n" },

                ["<BS>"] = { "actions.open_cwd", mode = "n" },
                ["`"] = { "actions.cd", mode = "n" },
                ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
                ["gs"] = { "actions.change_sort", mode = "n" },
                ["g."] = { "actions.toggle_hidden", mode = "n" },
                ["g\\"] = { "actions.toggle_trash", mode = "n" },
            },
            columns = {
                "icon",
                -- "permissions",
                -- "size",
                -- "mtime",
            },
            default_file_explorer = true,
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true,
                natural_order = "fast",
                case_insensitive = true,
                is_always_hidden = function(name, _)
                    return name == ".." or name == ".git"
                end,
            },
            win_options = {
                wrap = true,
            },
        })
    end,
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
}
