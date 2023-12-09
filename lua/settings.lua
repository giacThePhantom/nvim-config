-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- See `:help vim.o`
-- Set highlight on search
vim.o.hlsearch = false
vim.o.title = false

-- Make line numbers default
vim.wo.relativenumber = true
vim.wo.number = true


-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent (every wrapped line will be indented)
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Fix bad splitting behavior
vim.o.splitbelow = true
vim.o.splitright = true

-- Language spelling
vim.o.spell = true
vim.opt.spelllang = {'en', 'it'}

-- Tab width
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

-- Don't auto commenting new lines
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\n\+\%$//e]],
})
