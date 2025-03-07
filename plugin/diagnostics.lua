vim.fn.sign_define("DiagnosticSignError",  {text = '', texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",   {text = '',  texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",   {text = '',  texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",   {text = '',  texthl = "DiagnosticSignHint"})
vim.fn.sign_define("DiagnosticSignOther",   {text = '',  texthl = "DiagnosticSignOther"})

vim.cmd [[
hi DiagnosticUnderlineError guisp='Red' gui=underline
hi DiagnosticUnderlineWarn guisp='Cyan' gui=undercurl
]]

vim.diagnostic.config({
    update_in_insert = false,
    virtual_text = false,
    float = { border = 'rounded' },
    undercurl = true,
    signs = {
        priority = 30,
    }
})
