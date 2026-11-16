-- which-key: press Space (or g, ], [...) and wait to see what can follow
vim.pack.add({ "https://github.com/folke/which-key.nvim" }, { confirm = false })

local wk = require("which-key")
wk.setup({ icons = { mappings = false } })
wk.add({
  { "<leader>b", group = "buffer" },
  { "<leader>c", group = "code" },
  { "<leader>f", group = "files" },
  { "<leader>g", group = "git" },
  { "<leader>q", group = "quit" },
  { "<leader>s", group = "search" },
  { "<leader>u", group = "toggle" },
})
