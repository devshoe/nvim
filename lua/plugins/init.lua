return {
  

  {
    'thePrimeagen/vim-be-good',
    cmd = {'VimBeGood'},
  },
  {
    'fatih/vim-go',
    lazy = false,
  },

  {
    'rmagatti/auto-session',
    cmd = {'SessionSave'},
    config = function(opts)
      local opts = require('configs.autosession')
      require("auto-session").setup(opts)
    end
  },

  {
    'rmagatti/session-lens',
    requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
    cmd = {'SearchSession'},
    config = function()
      require('session-lens').setup({
        path_display = {'shorten'},
        theme = 'ivy', -- default is dropdown
        theme_conf = { border = false },
        previewer = true
      })
    end
  },

  {
    'tpope/vim-surround',
    lazy = false,
  },

  {
    'kristijanhusak/vim-dadbod-ui',
    lazy = false,
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  {
    'nvim-tree/nvim-web-devicons',
    lazy = false,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", "stylua",
        "html-lsp", "css-lsp" , "prettier",
        "gopls",
      },
    },
  },
  
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "javascript",
        "go", "rust", "python"
      },
    },
  },


}
