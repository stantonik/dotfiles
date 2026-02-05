-- plugins/cmp.lua

local servers = { "html", "cssls", "ts_ls", "pyright", "clangd", "marksman" }

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = servers,
                automatic_installation = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "mason-lspconfig.nvim" },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                border = "rounded",
                focusable = false,
            })

            for _, server in ipairs(servers) do
                lspconfig[server].setup({
                    capabilities = capabilities,
                })
            end

            -- Diagnostics
            vim.diagnostic.config({
                virtual_text = false,
                signs = true,
                underline = true,
                float = { border = "rounded", source = "always" },
            })

            -- LSP formatting
            vim.api.nvim_create_user_command("LspFormat", function()
                vim.lsp.buf.format({ async = true })
            end, { desc = "Format current buffer using LSP" })
        end,
    },
}

