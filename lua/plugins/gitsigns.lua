-- Git: changed lines in the margin, and acting on each change (hunk)
vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" }, { confirm = false })

require("gitsigns").setup({
  on_attach = function(buf)
    local gs = require("gitsigns")
    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
    end
    map("n", "]h", function()
      gs.nav_hunk("next")
    end, "Next change")
    map("n", "[h", function()
      gs.nav_hunk("prev")
    end, "Previous change")
    map("n", "<leader>gp", gs.preview_hunk, "Preview change")
    map("n", "<leader>gs", gs.stage_hunk, "Stage / unstage change")
    map("n", "<leader>gr", gs.reset_hunk, "Undo change")
    map("n", "<leader>gb", gs.blame_line, "Who wrote this line")
    map("n", "<leader>gd", gs.diffthis, "Diff this file")
  end,
})
