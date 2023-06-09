require('plugins/manager')
_G.__luacache_config = {
  chunks = {
    enable = true,
    path = vim.fn.stdpath('cache')..'/luacache_chunks',
  },
  modpaths = {
    enable = true,
    path = vim.fn.stdpath('cache')..'/luacache_modpaths',
  }
}

require('impatient')
require('mappings/general')
require('options/general')
require('autocmd/general')
require('options/telescope')
require('mappings/telescope')
require('options/tree-sitter')
require('autocmd/tree-sitter')
require('mappings/lsp')
require('plugins/neodev')
require('plugins/nvim-cmp')
require('plugins/mason')
require('options/vimtex')
require('options/luasnip')
require('mappings/luasnip')
require('snippets/latex')
require('snippets/python')
require('plugins/dap')
require('plugins/leap')
require('options/dapui')
require('mappings/dap')
require('mappings/tagbar')


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
