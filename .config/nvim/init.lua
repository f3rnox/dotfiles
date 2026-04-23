vim.g.loaded_matchit = 1

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- disable netrw in leu of plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = false

require("config.lazy")

-- vim.cmd.colorscheme("seoul256-light")
-- vim.cmd.colorscheme("gruvbox-baby")
-- vim.cmd.colorscheme("kanagawa")
-- vim.cmd.colorscheme("github")
-- vim.cmd.colorscheme("teide-light")
-- vim.cmd.colorscheme("PaperColor")
-- vim.cmd.colorscheme("two-firewatch")
-- vim.cmd.colorscheme("zephyr")
-- vim.cmd.colorscheme("moonfly")
-- vim.cmd.colorscheme("omni")
-- vim.cmd.colorscheme("aurora")
-- vim.cmd.colorscheme("shirotelin")
-- vim.cmd.colorscheme("dark_flat")
-- vim.cmd.colorscheme("everforest")
vim.cmd.colorscheme("jellybeans")

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  callback = function()
    vim.opt.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  callback = function()
    vim.opt.relativenumber = true
  end,
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

local kopts = { noremap = true, silent = true }

vim.keymap.set("n", "gd", vim.lsp.buf.definition, kopts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, kopts)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, kopts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, kopts)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, kopts)
vim.keymap.set('n', '<leader>g', ':Grepper<CR>', kopts)
vim.keymap.set('n', '<leader><space>', 'za', kopts)
vim.keymap.set('n', '<leader>q', ':qa<CR>', kopts)
vim.keymap.set('n', '<leader>rr', ':e ~/.config/nvim/init.lua<CR>', kopts)
vim.keymap.set('n', '<c-p>', ':Telescope find_files<CR>', kopts)
vim.keymap.set('n', '<leader>hl', ':nohlsearch<CR>', kopts)

vim.keymap.set('n', '<leader>bn', ':bnext<CR>', kopts)
vim.keymap.set('n', '<leader>bp', ':bprev<CR>', kopts)
vim.keymap.set('n', '<leader>bo', ':BufOnly<CR>', kopts)
vim.keymap.set('n', '<leader>hw', ':HopWord<CR>', kopts)

-- Resize with arrow keys (while in normal mode)
vim.keymap.set("n", "<up>", ":resize -2<CR>", { desc = "Decrease height" })
vim.keymap.set("n", "<down>", ":resize +2<CR>", { desc = "Increase height" })
vim.keymap.set("n", "<right>", ":vertical resize -2<CR>", { desc = "Decrease width" })
vim.keymap.set("n", "<left>", ":vertical resize +2<CR>", { desc = "Increase width" })

-- Session keybindings
vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end)
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end)
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end)
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end)
