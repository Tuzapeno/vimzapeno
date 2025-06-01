return {
    -- Render Markdown files with syntax highlighting and icons
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
    opts = {
        render_modes = true,
        sign = {
            enabled = false,
        },
    },
}
