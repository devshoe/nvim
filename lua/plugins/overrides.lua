return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      local opts = require("configs.telescope")
      require("telescope").setup(opts)
    end
  }
}
