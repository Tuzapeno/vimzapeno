return {
    -- Nvchad themes plugin
    "nvchad/base46",
    lazy = false,
    build = function()
        require("base46").load_all_highlights()
    end,
}
