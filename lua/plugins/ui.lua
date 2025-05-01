local map = vim.keymap.set

-- ============= Tabufline ================

map("n", "<Tab>", function()
    require("nvchad.tabufline").next()
end, { desc = "Next buffer" })

map("n", "<S-Tab>", function()
    require("nvchad.tabufline").prev()
end, { desc = "Prev buffer" })

map("n", "<leader>x", function()
    require("nvchad.tabufline").close_buffer()
end, { desc = "Close current buffer" })

map("n", "<leader>xh", function()
    require("nvchad.tabufline").closeBufs_at_direction("left")
end, { desc = "Close all buffers to the left" })

map("n", "<leader>xl", function()
    require("nvchad.tabufline").closeBufs_at_direction("right")
end, { desc = "Close all buffers to the right" })

-- ============= Term ======================

local float_opts = {
    pos = "float",
    id = "floatTerminal",
}

local vertical_opts = {
    pos = "vsp",
    size = 0.5,
    id = "verticalTerminal",
}

local horizontal_opts = {
    pos = "sp",
    size = 0.5,
    id = "horizontalTerminal",
}

map({ "n", "t" }, "<A-i>", function()
    require("nvchad.term").toggle(float_opts)
end, { desc = "Open floating terminal" })

map({ "n", "t" }, "<A-v>", function()
    require("nvchad.term").toggle(vertical_opts)
end, { desc = "Open vertical terminal" })

map({ "n", "t" }, "<A-t>", function()
    require("nvchad.term").toggle(horizontal_opts)
end, { desc = "Open horizontal terminal" })

-- ============= Theme Switcher ============

local theme_picker_opts = {
    style = "flat",
    border = true,
}

map("n", "<leader>th", function()
    require("nvchad.themes").open(theme_picker_opts)
end, { desc = "Open theme picker" })

return {
    -- Nvchad plugin that adds a bunch of features and UI
    "nvchad/ui",
    config = function()
        require("nvchad")
    end,
}
