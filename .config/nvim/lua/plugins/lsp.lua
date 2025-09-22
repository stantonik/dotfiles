-- plugins/cmp.lua

local servers = { "html", "cssls", "ts_ls", "pyright", "clangd", "marksman" }

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
                ensure_installed = servers,
                automatic_installation = true,
            })
        end,
    },

    -- LSP Config
    {
        "neovim/nvim-lspconfig",
        dependencies = { "mason-lspconfig.nvim" },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Show diagnostic floating windows when hovering over code
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                border = "rounded",
                focusable = false,
            })

            for _, server in ipairs(servers) do
                lspconfig[server].setup({
                    capabilities = capabilities,
                })
            end
        end,
    },
    -- {
    --     "jose-elias-alvarez/null-ls.nvim",
    --     requires = { "nvim-lua/plenary.nvim" },
    --     version = false,
    --     config=function()
    --         local null_ls = require("null-ls")

    --         null_ls.setup({
    --             sources = {
    --                 null_ls.builtins.formatting.prettier,
    --             },
    --         })
    --     end
    -- }
    vim.keymap.set("n", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
    end, { buffer = bufnr, desc = "[lsp] format" })

}

