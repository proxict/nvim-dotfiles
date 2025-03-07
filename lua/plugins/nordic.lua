return {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('nordic').setup({
            -- This callback can be used to override the colors used in the palette.
            on_palette = function(palette) return palette end,
            -- Enable bold keywords.
            bold_keywords = false,
            -- Enable italic comments.
            italic_comments = true,
            -- Enable general editor background transparency.
            transparent = {
                -- Enable transparent background.
                bg = false,
                -- Enable transparent background for floating windows.
                float = false,
            },
            -- Enable brighter float border.
            bright_border = false,
            -- Reduce the overall amount of blue in the theme (diverges from base Nord).
            reduced_blue = true,
            -- Swap the dark background with the normal one.
            swap_backgrounds = false,
            -- Make comments more visible
            after_palette = function(palette)
                palette.comment = "#6D7481"
            end,
            -- Make highlighting more visible
            on_highlight = function(highlights, palette)
                highlights.Visual.bg = "#5E81AC"
                highlights.Visual.fg = "#000000"
            end,
            -- Cursorline options.  Also includes visual/selection.
            cursorline = {
                -- Bold font in cursorline.
                bold = false,
                -- Bold cursorline number.
                bold_number = true,
                -- Avialable styles: 'dark', 'light'.
                theme = 'dark',
                -- Blending the cursorline bg with the buffer bg.
                blend = 0.9,
            },
            noice = {
                -- Available styles: `classic`, `flat`.
                style = 'flat',
            },
            telescope = {
                -- Available styles: `classic`, `flat`.
                style = 'flat',
            },
            leap = {
                -- Dims the backdrop when using leap.
                dim_backdrop = false,
            },
            ts_context = {
                -- Enables dark background for treesitter-context window
                dark_background = true,
            }
        })

        vim.cmd.colorscheme('nordic')
    end,
}
