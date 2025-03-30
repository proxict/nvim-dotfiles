return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    init = function(plugin)
        -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
        -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
        -- no longer trigger the **nvim-treesitter** module to be loaded in time.
        -- Luckily, the only things that those plugins need are the custom queries, which we make available
        -- during startup.
        require("lazy.core.loader").add_to_rtp(plugin)
        require("nvim-treesitter.query_predicates")
    end,
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    opts_extend = { "ensure_installed" },
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
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
        highlight = {
            enable = true,
            disable = { "" },
        },
        indent = { enable = false, disable = { "yaml", "php" } },
    },
    ---@param opts TSConfig
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
