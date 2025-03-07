return {
    'alx741/vim-rustfmt',
    keys = {
        { "<Leader>cf", "<cmd>Rustfmt<CR>", desc = "RustFmt", silent = true },
    },
    lazy = false,
    init = function()
        vim.g.rustfmt_on_save = false
    end
}
