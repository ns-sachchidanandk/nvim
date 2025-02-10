return {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = vim.opt.sessionoptions:get() }, -- Keep layout, buffers, folds, etc.
    keys = {
        { "<leader>r", function() require("persistence").load() end, desc = "Restore Session" },
        { "<leader>R", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
        { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Session" },
    }
}
