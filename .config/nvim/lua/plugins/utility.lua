-- plugins/utility.lua
return {
    {
        'windwp/nvim-autopairs',
        config=function()
            require('nvim-autopairs').setup()
        end
    },
    {
        'tpope/vim-commentary',
        'aperezdc/vim-template',
        'tpope/vim-surround',
    },
    { "EdenEast/nightfox.nvim" },
    -- {
    --     "iamcco/markdown-preview.nvim",
    --     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    --     ft = { "markdown" },
    --     build = function() vim.fn["mkdp#util#install"]() end,
    -- }
}
