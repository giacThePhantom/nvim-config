local map = vim.keymap.set

local dap, dapui = require("dap"), require("dapui")

dapui.setup({
  controls = {
    element = "repl",
    enabled = true,
    icons = {
      disconnect = "",
      pause = "",
      play = "",
      run_last = "",
      step_back = "",
      step_into = "",
      step_out = "",
      step_over = "",
      terminate = ""
    }
  },
  element_mappings = {},
  expand_lines = true,
  floating = {
    border = "single",
    mappings = {
      close = { "q", "<Esc>" }
    }
  },
  force_buffers = true,
  icons = {
    collapsed = "",
    current_frame = "",
    expanded = ""
  },
  layouts = { {
    elements = { {
      id = "scopes",
      size = 0.25
    }, {
      id = "breakpoints",
      size = 0.25
    }, {
      id = "stacks",
      size = 0.25
    }, {
      id = "watches",
      size = 0.25
    } },
    position = "left",
    size = 40
  }, {
    elements = { {
      id = "repl",
      size = 0.5
    }, {
      id = "console",
      size = 0.5
    } },
    position = "bottom",
    size = 10
  } },
  mappings = {
    edit = "e",
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    repl = "r",
    toggle = "t"
  },
  render = {
    indent = 1,
    max_value_lines = 100
  }
})

dap.adapters.python = {
  type = 'executable',
  command = 'python',
  args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return '/usr/bin/python'
    end,
  },
}


dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

map('n', '<leader>dc', dap.continue)
map('n', '<leader>dso', dap.step_over)
map('n', '<leader>dsi', dap.step_into)
map('n', '<leader>dst', dap.step_out)
map('n', '<leader>db', dap.toggle_breakpoint)
map('n', '<leader>do', dapui.open)
map('n', '<leader>de', dapui.close)
map('n', '<leader>dw', dapui.elements.watches.add)
