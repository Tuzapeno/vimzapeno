return {
    -- Formatting plugin
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            rs = { "rustfmt" },
            html = { "prettier" },
            css = { "prettier" },
            typescript = { "prettier" },
            javascript = { "prettier" },
            typescriptreact = { "prettier" },
            php = { "pint" },
            blade = { "blade-formatter" },
            python = { "black" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
    },
}
