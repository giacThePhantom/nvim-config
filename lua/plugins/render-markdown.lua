-- Markdown rendered in the buffer: headings, lists, code blocks, tables,
-- checkboxes and quotes drawn in place in normal mode; the line under the
-- cursor and insert mode show the raw text. Uses the markdown and
-- markdown_inline grammars (treesitter.lua).
vim.pack.add(
  { "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
  { confirm = false }
)

require("render-markdown").setup({})

vim.keymap.set("n", "<leader>um", function()
  require("render-markdown").buf_toggle()
end, { desc = "Markdown rendering" })
