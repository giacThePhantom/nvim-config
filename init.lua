-- Neovim configuration: plain Lua, plugins pinned by Neovim's own vim.pack
-- (nvim-pack-lock.json), so the same clone works on NixOS and on any other
-- machine with Neovim 0.12. See README.md.

-- Leader keys first: mappings made by plugins below read them
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Plugins, one file each; the colour scheme first so everything after it
-- picks up its colours
require("plugins.colors")
require("plugins.statusline")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.lsp")
require("plugins.format")
require("plugins.gitsigns")
require("plugins.render-markdown")
require("plugins.zellij-nav")
require("plugins.which-key")
