-- plugins/lsp.lua
return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/nvim-cmp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require('luasnip')
            cmp.setup({
                preselect = cmp.PreselectMode.Item,
                completion = {
                    completeopt = "menu,menuone,noselect",
                    keyword_length = 2,
                },
                -- Set up key mappings
                mapping = cmp.mapping.preset.insert({
                    -- Move to the next placeholder in snippets
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.confirm({ select = true })
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()  -- Jump to the next placeholder
                        else
                            fallback()  -- Fallback to default Tab behavior (e.g., completion)
                        end
                    end, { "i", "s" }),

                    -- Move to the previous placeholder in snippets
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)  -- Jump to the previous placeholder
                        else
                            fallback()  -- Fallback to default Shift+Tab behavior (e.g., completion)
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = 'luasnip' },
                }),
                -- Floating window diagnostics
                diagnostic = {
                    virtual_text = false,  -- Disable inline diagnostics
                    float = {
                        source = "always",    -- Always show source in floating window
                        border = "rounded",   -- Border style of the floating window
                    },
                },
            })
        end
    }
}
