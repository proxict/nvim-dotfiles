return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",

    opts = {
        ensure_installed = {
            "awk",
            "bash",
            "c",
            "cmake",
            "comment",
            "cpp",
            "css",
            "diff",
            "dockerfile",
            "dot",
            "git_config",
            "git_rebase",
            "gitattributes",
            "gitcommit",
            "gitignore",
            "glsl",
            "go",
            "hlsl",
            "html",
            "http",
            "ini",
            "javascript",
            "jq",
            "json",
            "json5",
            "jsonc",
            "lua",
            "luadoc",
            "luap",
            "make",
            "markdown",
            "markdown_inline",
            "mermaid",
            "meson",
            "ninja",
            "nix",
            "passwd",
            "pem",
            "perl",
            "php",
            "phpdoc",
            "proto",
            "python",
            "regex",
            "requirements",
            "rust",
            "scss",
            "sql",
            "toml",
            "tsx",
            "typescript",
            "vim",
            "vimdoc",
            "vue",
            "xml",
            "yaml",
            "zig",
        },
    },

    config = function(_, opts)
        require("nvim-treesitter").setup()

        require("nvim-treesitter").install(opts.ensure_installed)

        -- Automatically start treesitter highlighting for the installed langs
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(args.match)

                if lang and vim.treesitter.language.add(lang) then
                    vim.treesitter.start(args.buf, lang)
                end
            end,
        })
    end,
}
