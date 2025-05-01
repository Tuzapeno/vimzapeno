local function opts(desc)
    return { desc = "nvim-tree: " .. desc, noremap = true, silent = true, nowait = true }
end

-- Check if Neovim is opened with a directory argument
-- this is to load nvim-tree if Neovim is opened with a directory
-- but still lazy loads if nvim is opened with a file
local function open_nvim_tree_on_startup()
    local args = vim.fn.argv()
    if #args == 1 and vim.fn.isdirectory(args[1]) == 1 then
        -- Load nvim-tree plugin
        require("nvim-tree")
        -- Open nvim-tree
        require("nvim-tree.api").tree.open()
    end
end

vim.api.nvim_create_autocmd("VimEnter", {
    callback = open_nvim_tree_on_startup,
})

return {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    keys = { { "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" } },
    cmd = { "NvimTreeToggle" },
    opts = {
        sort = { sorter = "name" },
        renderer = {
            hidden_display = "all",
            highlight_git = "icon",
        },
        sync_root_with_cwd = true,
    },
    config = function(_, conf) -- conf receives the options table
        -- use 24-bit colors
        vim.opt.termguicolors = true

        -- use defaults
        require("nvim-tree").setup(conf)

        local api = require("nvim-tree.api")

        vim.keymap.set("n", "<C-n>", api.tree.toggle, opts("Toggle NvimTree"))
    end,
}
