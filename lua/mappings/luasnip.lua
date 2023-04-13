local map = vim.keymap.set
local ls = require('luasnip')

map({'i', 's'}, '<C-s>', function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, {noremap = true})

map({'i', 's'}, '<c-j>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, {noremap = true})

map('i', '<c-h>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, {noremap = true})

map('n', "<leader><c-s>", "<cmd>source ~/.config/nvim/lua/snippets/latex.lua<CR>")
