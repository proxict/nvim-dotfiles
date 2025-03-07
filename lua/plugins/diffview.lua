return {
    'sindrets/diffview.nvim',
    cmd = { "DiffviewClose", "DiffviewFileHistory", "DiffviewFocusFiles", "DiffviewLog", "DiffviewOpen", "DiffviewRefresh", "DiffviewToggleFiles" },
    keys = {
        {
            "<Leader>vg",
            function()
                if next(require('diffview.lib').views) == nil then
                    vim.cmd('DiffviewOpen')
                else
                    vim.cmd('DiffviewClose')
                end
            end,
            desc = "Git DiffView",
            silent = true,
        },
    },
    config = function()
        require("diffview").setup({})
    end,
}
