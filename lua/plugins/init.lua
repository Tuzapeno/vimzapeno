return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- Copilot
  {
    "github/copilot.vim",
    lazy = false,
  },
  -- Search filesystem
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = { "node_modules", ".git" },
      },
    },
  },
  -- Discord rich presence (i use vim btw)
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    lazy = false,
    -- opts = {}
  },
  -- Scroll smoothly
  {
    "karb94/neoscroll.nvim",
    config = function()
      require "configs.neoscroll"
    end,
    lazy = false,
  },
  -- Git!
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
}
