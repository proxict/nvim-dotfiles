return {
    "FabijanZulj/blame.nvim",
    version = '*',
    lazy = false,
    keys = {
        { "<Leader>vc", "<cmd>BlameToggle<CR>", desc = "Git Blame", noremap = true, silent = true },
    },
    config = function()
        require('blame').setup()
    end,
}
