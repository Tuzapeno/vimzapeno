return {
    -- A refactoring commands
    "ThePrimeagen/refactoring.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
        require("refactoring").setup({})
    end,
    -- TODO: i need to configure the keymaps properly
}
