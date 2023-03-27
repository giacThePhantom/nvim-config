local map = vim.keymap.set

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
map('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

map('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u', {noremap = true})


map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-l>', '<C-w>l')
