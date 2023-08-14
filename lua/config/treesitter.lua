require("nvim-treesitter.install").prefer_git = true

require("nvim-treesitter.configs").setup({
    ensure_installed = { "awk",
                         "bash",
                         "bibtex",
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
                         "kotlin",
                         "latex",
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
                         "ruby",
                         "rust",
                         "scss",
                         "sql",
                         "toml",
                         "typescript",
                         "vim",
                         "vimdoc",
                         "vue",
                         "xml",
                         "yaml",
                         "zig" },
    highlight = {
        enable = true,
        disable = { "" },
    },
    indent = { enable = true, disable = { "yaml" } },
})
