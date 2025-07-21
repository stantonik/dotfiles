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
        'tpope/vim-commentary',
        'aperezdc/vim-template',
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
