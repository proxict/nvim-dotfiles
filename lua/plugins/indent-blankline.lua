return {
    "lukas-reineke/indent-blankline.nvim",
    version = '*',
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function()
        require("ibl").setup({
            scope = { enabled = false },
        })
    end
}
