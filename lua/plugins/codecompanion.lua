return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("codecompanion").setup({
            strategies = {
                chat = {
                    adapter = "ollama",
                },
            },

            adapters = {
                ollama = function()
                    return require("codecompanion.adapters").extend("openai_compatible", {
                        env = {
                            url = "http://localhost:1234",
                        },
                    })
                end,
            },
        })
    end,
    keys = {
        {
            "<leader>cc",
            function()
                require("codecompanion").chat()
            end,
            desc = "Code Companion Chat",
        },
        {
            "<leader>cC",
            function()
                require("codecompanion").chat({ file = true })
            end,
            desc = "Code Companion Chat with File",
        },
    },
}
