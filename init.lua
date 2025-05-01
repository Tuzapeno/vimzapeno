-- Disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- put this in your main init.lua file ( before lazy setup ) -- NVChad ui configuration
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

require("config.lazy")

-- (method 1, For heavy lazyloaders) -- NVChad themes configuration
-- dofile(vim.g.base46_cache .. "defaults")
-- dofile(vim.g.base46_cache .. "statusline")

-- remember to lazy load these after...
-- (method 2, for non lazyloaders) to load all highlights at once
for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
    dofile(vim.g.base46_cache .. v)
end

require("config.keybindings")
require("config.options")
