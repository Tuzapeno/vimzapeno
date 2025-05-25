local M = {}

M.on_attach = function(client, bufnr)
    local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true, desc = desc })
    end
    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "K", vim.lsp.buf.hover, "Show documentation (hover)")
    map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
    map("n", "<C-k>", vim.lsp.buf.signature_help, "Show signature help")
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add folder to workspace")
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove folder from workspace")
    map("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "List workspace folders")
    map("n", "<leader>D", vim.lsp.buf.type_definition, "Go to type definition")
    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code actions")
    map("n", "gr", vim.lsp.buf.references, "Show references")
end

M.servers = {
    "pyright",
    "rust_analyzer",
    "lua_ls",
}

return M
