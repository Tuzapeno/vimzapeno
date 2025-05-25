return {
    -- Cursor editor AI assistant for Neovim
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
        provider = "copilot",
        model = "gpt-4o",
    },
    build = "make",
    dependencies = {
        {
            -- Make sure to set this up properly if you have lazy=true
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
    keys = {
        { "<leader>al", "<cmd>AvanteClear<cr>", desc = "Clear the chat window" },
    },
}
