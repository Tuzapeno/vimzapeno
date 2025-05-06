-- Send notification to user when response is ready and the user
-- currently has the chat window closed.
local notify_user = function(text)
    local buffer = vim.fn.bufnr("copilot-chat", false)
    local window_id = vim.fn.bufwinid(buffer)
    if window_id == -1 then
        vim.notify("  Your response is ready: " .. string.sub(text, 1, 50))
    end
end

return {
    -- Adds a copilot chat with support to any AI provider aswell as local models
    "CopilotC-Nvim/CopilotChat.nvim",
    init = function()
        -- Cleanup buffers when reloading plugin
        local chat = vim.fn.bufnr("copilot-overlay", false)
        local overlay = vim.fn.bufnr("copilot-chat", false)
        if chat ~= -1 then
            vim.api.nvim_buf_delete(chat, { force = true })
        end
        if overlay ~= -1 then
            vim.api.nvim_buf_delete(overlay, { force = true })
        end
    end,
    config = function(_, conf)
        conf = conf or {}
        conf.providers = conf.providers or {}

        local copilotc = require("CopilotChat")

        -- Sets notification callback
        conf.callback = notify_user

        -- Add custom providers
        local custom_providers = require("config.chat_providers") or {}
        for name, provider_config in pairs(custom_providers) do
            conf.providers[name] = provider_config
        end

        copilotc.setup(conf)
    end,
    -- Only in Linux and MacOS
    build = (vim.fn.has("mac") or vim.fn.has("unix")) and "make tiktoken" or nil,
    lazy = true,
    cmd = {
        "CopilotChat",
        "CopilotChatPrompts",
    },
    opts = {
        prompts = require("config.custom_prompts"),
        system_prompt = require("config.system_prompt"),
        question_header = " You ",
        answer_header = "  Tuzapenion ",
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
