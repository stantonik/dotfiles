-- plugins/utility.lua
return {
    {
        'windwp/nvim-autopairs',
        config=function()
            require('nvim-autopairs').setup()
        end
    },
    {
        'windwp/nvim-ts-autotag',
        config=function()
            require('nvim-ts-autotag').setup()
        end
    },
    {
        'aperezdc/vim-template',
        config=function()
            vim.g.templates_directory="~/.config/nvim/templates"
        end
    },
    {
        'tpope/vim-commentary',
        'tpope/vim-surround',
    },
    { "EdenEast/nightfox.nvim" },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async",
        },
        event = "BufReadPost",
        config = function()
            -- Required by ufo
            vim.o.foldcolumn = "1"
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            -- Keymaps (VSCode-like)
            vim.keymap.set("n", "zR", require("ufo").openAllFolds)
            vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

            require("ufo").setup({
                provider_selector = function(_, _, _)
                    -- Treesitter first, indent as fallback
                    return { "treesitter" }
                end,
            })
        end,
    },
}
