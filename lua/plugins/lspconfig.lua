return {
    'neovim/nvim-lspconfig',
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = false

        vim.lsp.config('*', { capabilities = capabilities })
        vim.lsp.enable({ 'clangd', 'rust_analyzer', 'bashls', 'pyright', 'cmake', 'ts_ls', 'zls' })

        -- Add rounded borders to floating windows
        local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or 'rounded'
            return orig_util_open_floating_preview(contents, syntax, opts, ...)
        end
    end,
}
