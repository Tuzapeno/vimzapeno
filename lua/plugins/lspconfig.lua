local on_attach = function(_, bufnr)
    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }
    opts.buffer = bufnr

    opts.desc = "See available code actions"
    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    -- This one comes from Nvchad UI plugin
    opts.desc = "Smart rename"
    keymap.set("n", "<leader>rn", require("nvchad.lsp.renamer"), opts)

    opts.desc = "Show line diagnostics"
    keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

    opts.desc = "Go to previous diagnostic"
    keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

    opts.desc = "Go to next diagnostic"
    keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

    opts.desc = "Show documentation for what is under the cursor"
    keymap.set("n", "K", vim.lsp.buf.hover, opts)

    opts.desc = "Restart LSP"
    keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
end

local servers = {
    "pyright",
    "rust_analyzer",
    "lua_ls",
}

-- Configure lsp icons
vim.opt.signcolumn = "yes"
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        },
    },
})

return {
    -- LSP
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- LSP completion source
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = cmp_nvim_lsp.default_capabilities()

        for _, server in ipairs(servers) do
            lspconfig[server].setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end

        lspconfig.rust_analyzer.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = { "rust" },
            settings = {
                ["rust-analyzer"] = {
                    cargo = {
                        allFeatures = true,
                    },
                },
            },
        })
    end,
}
