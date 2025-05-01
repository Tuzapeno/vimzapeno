return {
    -- Adds a copilot chat with support to any AI provider aswell as local models
    "CopilotC-Nvim/CopilotChat.nvim",
    config = function(_, conf)
        conf = conf or {}
        conf.providers = conf.providers or {}

        -- Add custom providers
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
    opts = {
        prompts = require("config.custom_prompts"),
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
            function()
                require("CopilotChat").select_model()
            end,
            desc = "Toggle Model Selection Window",
            mode = { "n" },
        },
        {
            "<leader>cp",
            function()
                require("CopilotChat").select_prompt()
            end,
            desc = "Toggle Prompt Selection Window",
            mode = { "n", "v" },
        },
    },
}
