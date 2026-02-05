-- Basic Settings
vim.o.number = true            -- Show line numbers
vim.o.relativenumber = true    -- Relative line numbers
vim.o.linebreak = true        -- Wrap at word boundaries
vim.o.scrolloff = 8           -- Always keep 8 lines visible above and below the cursor
vim.o.hlsearch = true         -- Highlight search results
vim.o.incsearch = true        -- Incremental search (shows matches as you type)
vim.o.cursorline = true       -- Highlight the line of the cursor
vim.o.termguicolors = true    -- Enable true colors in the terminal
vim.o.wrapscan = true         -- Search wraps around the file
vim.o.showmatch = true        -- Show matching parentheses/braces

-- Tabs and indentation
vim.o.tabstop = 4             -- Number of spaces a tab counts for
vim.o.shiftwidth = 4          -- Number of spaces to use for (auto)indent
vim.o.softtabstop = 4         -- Insert spaces for tab characters
vim.o.autoindent = true       -- Enable automatic indentation
vim.o.smartindent = true      -- Enable smart indentation
vim.o.expandtab = true        -- Convert tabs to spaces
vim.o.smarttab = true         -- Smart tabbing


-- Backup and Swap files
vim.o.swapfile = false        -- Disable swap file creation
vim.o.backup = false          -- Disable backup file creation
vim.o.writebackup = false     -- Disable backup before overwriting
vim.o.undofile = true         -- Enable persistent undo

-- Display settings
vim.o.showcmd = true          -- Show command in the bottom bar
vim.o.cmdheight = 1           -- Height of the command line
vim.o.showmatch = true        -- Highlight matching parentheses

-- Clipboard settings (use system clipboard)
vim.o.clipboard = "unnamedplus"  -- Use the system clipboard

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Templates
vim.g.templates_directory = "Users/stantonik/.config/nvim/templates"

-- enable treesitter folding
-- Treesitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true

-- Open all folds by default
vim.opt.foldlevelstart = 99

-- Save only folds & cursor per file
vim.opt.viewoptions = { "cursor", "folds" }

-- Persist folds per file
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    vim.cmd("silent! loadview")
  end,
})

vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*",
  callback = function()
    if vim.bo.buftype == "" then
      vim.cmd("mkview")
    end
  end,
})

