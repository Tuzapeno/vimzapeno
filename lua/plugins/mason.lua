return {
    -- LSP Package manager
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    lazy = false,
    config = function()
        local mason = require("mason")

        local mason_lspconfig = require("mason-lspconfig")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            -- list servers to mason install
            ensure_installed = {
                "lua_ls",
                "pyright",
                "rust_analyzer",
                "html",
                "cssls",
                "tailwindcss",
                "jsonls",
                "clangd",
                "ts_ls",
                "intelephense",
            },

            -- auto install configured servers
            automatic_installation = true, -- configured servers in the LSP not in ensure_installed
        })
    end,
}
