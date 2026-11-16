-- Statusline: mode, git branch and changes, diagnostics, file, position
vim.pack.add({ "https://github.com/nvim-mini/mini.statusline" }, { confirm = false })
require("mini.statusline").setup({ use_icons = false })
