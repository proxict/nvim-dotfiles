return {
    'neovim/nvim-lspconfig',
    config = function()
        local lspconfig = require('lspconfig')

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = false

        local servers = { 'clangd', 'rust_analyzer', 'bashls', 'pyright', 'cmake', 'ts_ls', 'zls' }
        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup {
                on_attach = function(client)
                    -- :help vim.lsp.semantic_tokens.start()
                    client.server_capabilities.semanticTokensProvider = nil
                end,
                capabilities = capabilities,
            }
        end

        -- Add rounded borders to floating windows
        local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or 'rounded'
            return orig_util_open_floating_preview(contents, syntax, opts, ...)
        end
    end,
}
