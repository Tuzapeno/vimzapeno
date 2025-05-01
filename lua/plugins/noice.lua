return {
    -- Using this plugin to make the command interface more pretty
    -- I'm disabling other modules because other plugins cover that up
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        messages = { enabled = false },
        popupmenu = { enabled = false },
        notify = { enabled = false },
        lsp = {
            progress = { enabled = false },
            hover = { enabled = false },
            signature = { enabled = false },
            message = { enabled = false },
        },
    },
}
