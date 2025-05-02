return {
    -- A refactoring commands
    "ThePrimeagen/refactoring.nvim",
    lazy = true,
    cmd = { "Refactor" },
    config = function()
        require("refactoring").setup({})
    end,
    keys = {
        { "<leader>re", ":Refactor extract", desc = "Extract selection to function", mode = { "n" } },
        { "<leader>rf", ":Refactor extract_to_file", desc = "Extract selection to file", mode = { "x" } },

        { "<leader>rv", ":Refactor extract_var", desc = "Extract selection to variable", mode = { "x" } },

        { "<leader>ri", ":Refactor inline_var", desc = "Inline variable", mode = { "n", "x" } },

        { "<leader>rI", ":Refactor inline_func", desc = "Inline function", mode = { "n" } },

        { "<leader>rb", ":Refactor extract_block", desc = "Extract block", mode = { "n" } },
        { "<leader>rbf", ":Refactor extract_block_to_file", desc = "Extract block to file", mode = { "n" } },
    },
}
