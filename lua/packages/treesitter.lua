vim.defer_fn(function()
  require('nvim-treesitter.configs').setup { -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash' },

    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    auto_install = false,

    highlight = { enable = true, disable = { 'latex' } },
    -- indent = { enable = true, disable = { 'python' } },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<M-space>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']f'] = '@function.outer',
          [']c'] = '@class.outer',
          [']l'] = '@loop.outer',
          [']i'] = '@conditional.outer',
        },
        goto_next_end = {
          [']F'] = '@function.outer',
          [']C'] = '@class.outer',
          [']L'] = '@loop.outer',
          [']I'] = '@conditional.outer',
        },
        goto_previous_start = {
          ['[f'] = '@function.outer',
          ['[c'] = '@class.outer',
          ['[l'] = '@loop.outer',
          ['[i'] = '@conditional.outer',
        },
        goto_previous_end = {
          ['[F'] = '@function.outer',
          ['[C'] = '@class.outer',
          ['[L'] = '@loop.outer',
          ['[I'] = '@conditional.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>p'] = '@parameter.inner',
          ['<leader>l'] = '@statement.outer',
        },
        swap_previous = {
          ['<leader>P'] = '@parameter.inner',
          ['<leader>L'] = '@statement.outer',
        },
      },
    },
  }
end, 0)
