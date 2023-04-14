local map = vim.keymap.set

local dap = require('dap')

map('n', '<leader>dc', dap.continue)
map('n', '<leader>dso', dap.step_over)
map('n', '<leader>dsi', dap.step_into)
map('n', '<leader>dst', dap.step_out)
map('n', '<leader>db', dap.toggle_breakpoint)
