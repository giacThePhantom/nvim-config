require('lazy').setup({
  -- Git stuff
  'nvim-neotest/nvim-nio',
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'lewis6991/gitsigns.nvim',
  -- Indentation
  'tpope/vim-sleuth',
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
  },
  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  -- gc to comment
  'numToStr/Comment.nvim',
  { -- Colorscheme
    'morhetz/gruvbox',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'gruvbox'
    end,
  },
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      'j-hui/fidget.nvim',
      tag = 'legacy',

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    }

  },
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {'L3MON4D3/LuaSnip', run ="make install_jsregrexp"},
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      -- 'rafamadriz/friendly-snippets', TAKE FROM THIS WHAT YOU NEED
    },
  },
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
  },
  -- [[LaTeX Stuff]]
  'jbyuki/nabla.nvim',
  'lervag/vimtex',
  -- Status line
  'nvim-lualine/lualine.nvim',
  -- Notebook stuff
  --    'luk400/vim-jukit',
  'tell-k/vim-autopep8',
  'jamespeapen/Nvim-R',
  {"vimwiki/vimwiki",
  init = function()
    vim.g.mapleader = ' '
    vim.g.vimwiki_list = {{
      path = '~/vimwiki/',
      syntax = 'default',
      ext = '.wiki',
    }}
    vim.g.vimwiki_global_ext = 0
  end,

  },
  'echasnovski/mini.icons',
  'nvim-tree/nvim-web-devicons',
})
