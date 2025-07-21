-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Doc" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<C-f>", vim.lsp.buf.format, { desc = "Format" })

-- Diagnostics
vim.keymap.set("n", "<leader>Nd", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next)

-- Show diagnostics on hover
vim.keymap.set("n", "<leader>hd", function()
  vim.diagnostic.open_float(nil, { focusable = false })
end, { desc = "Show Hover Doc and Diagnostics" })
