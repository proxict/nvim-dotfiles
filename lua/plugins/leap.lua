return {
    "ggandor/leap.nvim",
    lazy = false,
    keys = {
        { "t", "<Plug>(leap-forward)", mode = { "n" }, desc = "Leap Forward", noremap = true, silent = true },
        { "T", "<Plug>(leap-backward)", mode = { "n" }, desc = "Leap Backward", noremap = true, silent = true },
    },
    config = function()
        require('leap').setup({
            safe_labels = {},
        })
    end,
}
