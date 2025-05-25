return {
    -- A collection of plugins all in one
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        dashboard = { -- 
            pane_gap = 18,
            preset = {
                header = [[
██╗   ██╗██╗███╗   ███╗███████╗ █████╗ ██████╗ ███████╗███╗   ██╗ ██████╗
 ██║   ██║██║████╗ ████║╚══███╔╝██╔══██╗██╔══██╗██╔════╝████╗  ██║██╔═══██╗
 ██║   ██║██║██╔████╔██║  ███╔╝ ███████║██████╔╝█████╗  ██╔██╗ ██║██║   ██║
 ╚██╗ ██╔╝██║██║╚██╔╝██║ ███╔╝  ██╔══██║██╔═══╝ ██╔══╝  ██║╚██╗██║██║   ██║
  ╚████╔╝ ██║██║ ╚═╝ ██║███████╗██║  ██║██║     ███████╗██║ ╚████║╚██████╔╝
   ╚═══╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═══╝ ╚═════╝ ]],
            },
            sections = {
                { section = "header" },
                { section = "projects", padding = 1 },
                { section = "keys", gap = 1, padding = 1 },
                { section = "startup" },
            },
        },
        input = { enabled = true }, -- 
        picker = { -- 
            enabled = true,
            ui_select = true,
        },
        notifier = { enabled = false }, -- 
        lazygit = { enabled = true }, -- 
        zen = { enabled = true }, -- 
    },
    keys = {
        -- =================== SCRATCH =========================
        {
            "<leader>.",
            function()
                require("snacks").scratch()
            end,
            desc = "Toggle Scratch Buffer",
        },
        {
            "<leader>S",
            function()
                require("snacks").scratch.select()
            end,
            desc = "Select Scratch Buffer",
        },
        -- ==================== LAZY-GIT =======================

        {
            "<leader>lg",
            function()
                require("snacks").lazygit()
            end,
            desc = "LazyGit",
        },

        -- ======================= ZEN ==========================

        {
            "<leader>zz",
            function()
                require("snacks").zen()
            end,
            desc = "Zen Mode",
        },

        -- ======================= PICKER =======================

        -- Top Pickers
        {
            "<leader><space>",
            function()
                require("snacks").picker.smart()
            end,
            desc = "Smart Find Files",
        },
        {
            "<leader>/",
            function()
                require("snacks").picker.grep()
            end,
            desc = "Grep",
        },
        {
            "<leader>n",
            function()
                require("snacks").picker.notifications()
            end,
            desc = "Notification History",
        },
        {
            "<leader>ff",
            function()
                require("snacks").picker.files()
            end,
            desc = "Find Files",
        },
        {
            "<leader>fg",
            function()
                require("snacks").picker.git_files()
            end,
            desc = "Find Git Files",
        },
        {
            "<leader>fp",
            function()
                require("snacks").picker.projects()
            end,
            desc = "Projects",
        },
        {
            "<leader>fr",
            function()
                require("snacks").picker.recent()
            end,
            desc = "Recent",
        },
        -- git
        {
            "<leader>gb",
            function()
                require("snacks").picker.git_branches()
            end,
            desc = "Git Branches",
        },
        {
            "<leader>gl",
            function()
                require("snacks").picker.git_log()
            end,
            desc = "Git Log",
        },
        {
            "<leader>gL",
            function()
                require("snacks").picker.git_log_line()
            end,
            desc = "Git Log Line",
        },
        {
            "<leader>gs",
            function()
                require("snacks").picker.git_status()
            end,
            desc = "Git Status",
        },
        {
            "<leader>gS",
            function()
                require("snacks").picker.git_stash()
            end,
            desc = "Git Stash",
        },
        {
            "<leader>gd",
            function()
                require("snacks").picker.git_diff()
            end,
            desc = "Git Diff (Hunks)",
        },
        {
            "<leader>gf",
            function()
                require("snacks").picker.git_log_file()
            end,
            desc = "Git Log File",
        },
        -- Grep
        {
            "<leader>sg",
            function()
                require("snacks").picker.grep()
            end,
            desc = "Grep",
        },
        {
            "<leader>sw",
            function()
                require("snacks").picker.grep_word()
            end,
            desc = "Visual selection or word",
            mode = { "n", "x" },
        },
        -- search
        {
            '<leader>s"',
            function()
                require("snacks").picker.registers()
            end,
            desc = "Registers",
        },
        {
            "<leader>s/",
            function()
                require("snacks").picker.search_history()
            end,
            desc = "Search History",
        },
        {
            "<leader>sa",
            function()
                require("snacks").picker.autocmds()
            end,
            desc = "Autocmds",
        },

        {
            "<leader>sc",
            function()
                require("snacks").picker.command_history()
            end,
            desc = "Command History",
        },
        {
            "<leader>sC",
            function()
                require("snacks").picker.commands()
            end,
            desc = "Commands",
        },
        {
            "<leader>sd",
            function()
                require("snacks").picker.diagnostics()
            end,
            desc = "Diagnostics",
        },
        {
            "<leader>sD",
            function()
                require("snacks").picker.diagnostics_buffer()
            end,
            desc = "Buffer Diagnostics",
        },
        {
            "<leader>sh",
            function()
                require("snacks").picker.help()
            end,
            desc = "Help Pages",
        },

        {
            "<leader>si",
            function()
                require("snacks").picker.icons()
            end,
            desc = "Icons",
        },
        {
            "<leader>sk",
            function()
                require("snacks").picker.keymaps()
            end,
            desc = "Keymaps",
        },
        {
            "<leader>sM",
            function()
                require("snacks").picker.man()
            end,
            desc = "Man Pages",
        },
        {
            "<leader>sp",
            function()
                require("snacks").picker.lazy()
            end,
            desc = "Search for Plugin Spec",
        },
        -- LSP
        {
            "gd",
            function()
                require("snacks").picker.lsp_definitions()
            end,
            desc = "Goto Definition",
        },
        {
            "gD",
            function()
                require("snacks").picker.lsp_declarations()
            end,
            desc = "Goto Declaration",
        },
        {
            "gr",
            function()
                require("snacks").picker.lsp_references()
            end,
            nowait = true,
            desc = "References",
        },
        {
            "gI",
            function()
                require("snacks").picker.lsp_implementations()
            end,
            desc = "Goto Implementation",
        },
        {
            "gy",
            function()
                require("snacks").picker.lsp_type_definitions()
            end,
            desc = "Goto T[y]pe Definition",
        },
        {
            "<leader>ss",
            function()
                require("snacks").picker.lsp_symbols()
            end,
            desc = "LSP Symbols",
        },
    },
}
