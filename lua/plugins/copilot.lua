return {
    -- Inline autocompletions using Github Copilot
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            suggestion = {
                auto_trigger = true,
                hide_during_completion = false,
                keymap = {
                    accept = false,
                },
            },
        })
        vim.keymap.set("i", "<Tab>", function()
            if require("copilot.suggestion").is_visible() then
                require("copilot.suggestion").accept()
            else
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
            end
        end, { desc = "Super Tab" })
    end,
}
