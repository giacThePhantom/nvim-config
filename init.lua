-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('packages')
require('settings')
require('vanilla_keybindings')
require('packages/fidget')
require('packages/which-key')
require('packages/gitsigns')
require('packages/lualine')
require('packages/indent-blankline')
require('packages/comment')
require('packages/telescope')
require('packages/lsp')
require('packages/neodev')
require('packages/cmp')
require('packages/mason')
require('packages/nvim-dap')
require('packages/treesitter')

require('packages/nabla')
require('packages/copilot')

require('packages/vimtex')

require('packages/jukit')
require('packages/autopep8')

require('packages/nvim-r')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
