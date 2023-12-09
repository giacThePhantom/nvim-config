      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<C-s>",
            accept_word = false,
            accept_line = false,
          },
        },
        filetypes = {
        },
        copilot_node_command = 'node', -- Node.js version must be > 16.x
        server_opts_overrides = {},
      })
