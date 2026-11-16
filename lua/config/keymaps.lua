-- Keys that need no plugin; the rest live with their plugin. Leader is Space.
local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<cr><Esc>", { desc = "Clear search highlight" })
map({ "n", "i", "x" }, "<C-s>", "<cmd>write<cr><Esc>", { desc = "Save" })
map("n", "<leader>qq", "<cmd>qall<cr>", { desc = "Quit all" })

-- Buffers (Ctrl+H/J/K/L between windows: plugins/zellij-nav.lua)
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Close buffer" })

-- Keep the selection when indenting
map("x", "<", "<gv")
map("x", ">", ">gv")

-- Diagnostics (]d and [d are built in)
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line diagnostics" })

-- Toggles
map("n", "<leader>uw", function()
  vim.wo.wrap = not vim.wo.wrap
end, { desc = "Toggle line wrap" })
map("n", "<leader>ud", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })
map("n", "<leader>uh", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })
