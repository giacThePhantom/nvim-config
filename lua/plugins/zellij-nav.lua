-- Ctrl+H/J/K/L: move to the window on that side and, at the edge, on to the
-- zellij pane there. Outside zellij they only move between windows. zellij's
-- half (vim-zellij-navigator, ~/.config/nixos modules/terminal.nix) passes
-- these keys to Neovim when it is focused.
vim.pack.add({ "https://github.com/swaits/zellij-nav.nvim" }, { confirm = false })

local nav = require("zellij-nav")
nav.setup({})

vim.keymap.set("n", "<C-h>", nav.left, { desc = "Window or pane left" })
vim.keymap.set("n", "<C-j>", nav.down, { desc = "Window or pane below" })
vim.keymap.set("n", "<C-k>", nav.up, { desc = "Window or pane above" })
vim.keymap.set("n", "<C-l>", nav.right, { desc = "Window or pane right" })
