local utils = require("config.lsp_callbacks")

return {
    -- LSP
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- LSP completion source
    },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        vim.lsp.config("*", {
            capabilities = capabilities,
            root_markers = { ".git", "Makefile", "package.json" },
        })
        vim.lsp.enable(utils.servers)
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                utils.on_attach(client, args.buf)
            end,
        })
    end,
}
