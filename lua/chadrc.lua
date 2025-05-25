----- This file is for customizing the base46 and UI settings that come with both nvchad/ui and nvchad/base46 plugins

local M = {}

M.base46 = {
    theme = "catppuccin",
}

M.ui = {
    statusline = {
        theme = "minimal",
        separator_style = "round",
    },
    cmp = {
        abbr_maxwidth = 50,
        icons = true,
    },
}

M.term = {
    float = {
        row = 0.25,
        col = 0.20,
        width = 0.6,
        height = 0.5,
        border = "rounded",
    },
}

return M
