vim.diagnostic.config({
    update_in_insert = false,
    virtual_text = false,
    float = { border = 'rounded' },
    undercurl = true,
    signs = {
        priority = 30,
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        },
    },
})
