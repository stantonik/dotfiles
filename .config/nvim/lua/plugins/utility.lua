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
}
