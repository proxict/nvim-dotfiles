return {
    '3rd/image.nvim',
    dependencies = { 'kiyoon/magick.nvim' },
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    config = function()
        if os.getenv("DISPLAY") ~= nil then
            require("magick")
            require("image").setup()
        end
    end,
    opts = {},
}
