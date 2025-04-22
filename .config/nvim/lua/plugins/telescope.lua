-- plugins/telescope.lua
return { 
    {
        "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            -- Files
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Live Grep" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Buffers" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Help Tags" },

            -- Git
            { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },
            { "<leader>gs", "<cmd>Telescope git_status<cr>",  desc = "Git Status" },

            -- LSP
            { "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "LSP References" },
            { "<leader>ld", "<cmd>Telescope lsp_definitions<cr>", desc = "LSP Definitions" },
            { "<leader>li", "<cmd>Telescope lsp_implementations<cr>", desc = "LSP Implementations" },
        },
    }
}

