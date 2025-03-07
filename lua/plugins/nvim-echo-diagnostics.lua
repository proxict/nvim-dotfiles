return {
    'seblyng/nvim-echo-diagnostics',
    config = function()
        require("echo-diagnostics").setup({
            show_diagnostic_number = true,
            show_diagnostic_source = false,
        })

        vim.cmd[[
        autocmd CursorHold * lua require('echo-diagnostics').echo_line_diagnostic()
        ]]
    end,
}
