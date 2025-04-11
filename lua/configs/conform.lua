local options = {
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
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
