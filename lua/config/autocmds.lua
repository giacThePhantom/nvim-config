-- Small automatic behaviours
local group = vim.api.nvim_create_augroup("config", { clear = true })

-- Flash what was just copied
vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Reopen a file where you left it
vim.api.nvim_create_autocmd("BufReadPost", {
  group = group,
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local lines = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= lines and vim.bo[args.buf].filetype ~= "gitcommit" then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Prose wraps at word boundaries and gets spell checking
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "markdown", "text", "gitcommit", "typst", "tex" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
