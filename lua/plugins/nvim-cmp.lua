local kind_icons = {
    Namespace = "󰌗",
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰆧",
    Constructor = "",
    Field = "󰜢",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󱓻",
    File = "󰈚",
    Reference = "󰈇",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "󰙅",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "󰊄",
    Table = "",
    Object = "󰅩",
    Tag = "",
    Array = "[]",
    Boolean = "",
    Number = "",
    Null = "󰟢",
    Supermaven = "",
    String = "󰉿",
    Calendar = "",
    Watch = "󰥔",
    Package = "",
    Copilot = "",
    Codeium = "",
    TabNine = "",
    BladeNav = "",
}

return {
    -- Completion plugin
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer", -- buffer completions
        "hrsh7th/cmp-path", -- path completions
        "L3MON4D3/LuaSnip", -- snippet engine
        "saadparwaiz1/cmp_luasnip", -- autocompletion
        "windwp/nvim-autopairs", -- for auto closing brackets, quotes, etc.
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local autopairs_cmp = require("nvim-autopairs.completion.cmp")
        local autopairs = require("nvim-autopairs")

        autopairs.setup()

        -- Add parenthesis when selecting function completions
        cmp.event:on("confirm_done", autopairs_cmp.on_confirm_done())

        local options = {
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
            window = {
                completion = vim.tbl_deep_extend("force", cmp.config.window.bordered(), {
                    scrollbar = false,
                }),
                documentation = vim.tbl_deep_extend("force", cmp.config.window.bordered(), {
                    max_width = 50,
                    max_height = 50,
                }),
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = {
                ["<C-p>"] = cmp.mapping.select_prev_item(), -- next item
                ["<C-n>"] = cmp.mapping.select_next_item(), -- prev item
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(), -- trigger completion
                ["<C-e>"] = cmp.mapping.abort(), -- cancel completion
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            },
            -- sources for completion
            sources = {
                { name = "lazy_dev" },
                { name = "nvim_lsp" }, -- LSP
                { name = "luasnip" }, -- snippets
                { name = "buffer" }, -- buffer completions
                { name = "path" }, -- path completions
            },
            formatting = {
                format = function(_, vim_item)
                    vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
                    vim_item.menu = nil
                    return vim_item
                end,
            },
        }

        -- Load the Nvchad visual configurations
        options = vim.tbl_deep_extend("force", require("nvchad.cmp"), options)

        cmp.setup(options)
    end,
}
