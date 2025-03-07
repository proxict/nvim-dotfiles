return {
    'lambdalisue/vim-suda',
    lazy = false,
    config = function()
        vim.cmd('command W w suda://%')
    end,
}
