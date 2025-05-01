return {
    "CopilotC-Nvim/CopilotChat.nvim",
    config = function(_, conf)
        conf = conf or {}
        conf.providers = conf.providers or {}
        local custom_providers = require("config.chat_providers")
        for name, provider_config in pairs(custom_providers) do
            conf.providers[name] = provider_config
        end
        require("CopilotChat").setup(conf)
    end,
    build = "make tiktoken", -- Only on MacOS or Linux
    lazy = false,
    cmd = {
        "CopilotChat",
        "CopilotChatPrompts",
    },
    keys = {
        {
            "<leader>cc",
            function()
                require("CopilotChat").toggle()
            end,
            desc = "Toggle Copilot Chat",
            mode = { "n" },
        },
        {
            "<leader>cm",
            "<CMD>CopilotChatModel<CR>",
            desc = "Toggle Model Selection Window",
            mode = { "n" },
        },
        {
            "<leader>cp",
            "<CMD>CopilotChatPrompts<CR>",
            desc = "Toggle Prompt Selection Window",
            mode = { "n", "v" },
        },
    },
}
