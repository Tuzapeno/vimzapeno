return {
    "rcarriga/nvim-notify",
    lazy = true,
    opts = {
        render = "wrapped-compact",
        stages = "fade",
    },
    config = function(_, conf)
        local notify = require("notify")
        notify.setup(conf)
        vim.notify = notify
    end,
}
