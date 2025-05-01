return {
    -- Syntax highlighting
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "VeryLazy" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
