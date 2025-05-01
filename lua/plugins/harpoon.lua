return {
    -- Plugin for creating marks in files and navigating between them
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = true,
    event = "VeryLazy",
    -- TODO: i need to configure the keymaps properly, and lazy load it
    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup()
        -- REQUIRED

        vim.keymap.set("n", "<leader>ha", function()
            harpoon:list():add()
        end, { desc = "󰛢 Add file to Harpoon" })

        vim.keymap.set("n", "<C-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "󰛢 Toggle Harpoon quick menu" })

        vim.keymap.set("n", "<A-h>", function()
            harpoon:list():select(1)
        end, { desc = "󰛢 Select 1st file in Harpoon" })

        vim.keymap.set("n", "<A-j>", function()
            harpoon:list():select(2)
        end, { desc = "󰛢 Select 2nd file in Harpoon" })

        vim.keymap.set("n", "<A-k>", function()
            harpoon:list():select(3)
        end, { desc = "󰛢 Select 3rd file in Harpoon" })

        vim.keymap.set("n", "<A-l>", function()
            harpoon:list():select(4)
        end, { desc = "󰛢 Select 4th file in Harpoon" })

        -- Toggle previous & next buffers stored within Harpoon list
        -- vim.keymap.set("n", "<C-S-P>", function()
        --     harpoon:list():prev()
        -- end)
        --
        -- vim.keymap.set("n", "<C-S-N>", function()
        --     harpoon:list():next()
        -- end)
    end,
}
