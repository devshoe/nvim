return {
  {
    "nvim-telescope/telescope-file-browser.nvim",
    branch = "feat/tree",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      local opts = require("configs.telescope")
      require("telescope").setup(opts.telescope)
      require("telescope").load_extension("file_browser")
    end
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "nvchad.configs.nvimtree"
    end,
    config = function(_, opts)
      opts = require('configs.nvimtree')
      require("nvim-tree").setup(opts)
    end,
  },
}
