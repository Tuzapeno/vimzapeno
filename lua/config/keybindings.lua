local map = vim.keymap.set

-- ================= NAVIGATION =================

-- Quick window switch
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- Scroll and center cursor position
map("n", "<C-d>", "zz<C-d>zz", { desc = "scroll down and center cursor" })
map("n", "<C-u>", "zz<C-u>zz", { desc = "scroll up and center cursor" })
map("n", "<C-F>", "zz<C-F>zz", { desc = "scroll down and center cursor" })
map("n", "<C-B>", "zz<C-B>zz", { desc = "scroll up and center cursor" })

-- Center and select word while searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Move selected lines up and down
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "move selected lines down" })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "move selected lines up" })

-- Goto start of line
map("n", "0", "^", { desc = "goto start of line" })

-- ================== FILES ==================

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

-- Paste without overwriting default register
map("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting default register" })

-- Copy selection to clipboard
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to clipboard" })

-- Deletes without overwriting default register
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Deletes without overwriting default register" })

-- =================== MISC ==================

map("n", "<leader><leader>", function()
    vim.cmd("so")
end, { desc = "Reload neovim configuration" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
