return -- lazy.nvim
{
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
        restriction_mode = "hint",
        show_mode = false,
        disabled_filetypes = { "NvimTree" },
    },
}
