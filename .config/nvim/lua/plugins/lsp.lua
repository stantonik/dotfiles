-- plugins/cmp.lua
return {
    -- Mason: installs LSPs, DAPs, linters, etc.
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    -- Mason-LSPConfig bridge: tells Mason which LSPs to auto-install
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "clangd" }, -- you can add more here
                automatic_installation = true,
            })
        end,
    },

    -- LSP Config
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Show diagnostic floating windows when hovering over code
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                border = "rounded",
                focusable = false,   -- Don't make the hover window focusable
            })

            -- Auto-setup for all mason-installed servers
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
            })
        end,
    },
}

