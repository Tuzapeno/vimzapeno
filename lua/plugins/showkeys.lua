return {
    -- Makes a little screen that shows typed keys
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
    lazy = true,
    event = "VeryLazy",
    opts = {
        timeout = 1,
        maxkeys = 5,
    },
}
