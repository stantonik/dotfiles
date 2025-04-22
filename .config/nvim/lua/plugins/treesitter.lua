-- plugins/treesitter.lua
return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufRead", "BufNewFile" },
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = { "python", "javascript", "lua", "cpp", "c" },
                highlight = {
                    enable = true,  -- Enable Treesitter-based highlighting
                    additional_vim_regex_highlighting = false,  -- Disable old regex-based highlighting
                },
                indent = {
                    enable = true,  -- Enable Treesitter-based indentation
                },
            }
        end,
    }
}
