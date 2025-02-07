return {
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        opts = function()
            require("Comment").setup({
                padding = true, -- Add a space between comment and text
                sticky = true, -- Keep cursor in place after commenting
                ignore = "^$", -- Ignore empty lines when toggling
                toggler = {
                    line = "gcc", -- Toggle line comment
                    block = "<leader>?", -- Toggle block comment
                },
                opleader = {
                    line = "gcc", -- Operator pending mode for line comment
                    block = "<leader>?", -- Operator pending mode for block comment
                },
                mappings = {
                    basic = true, -- Enable basic mappings
                    extra = false, -- Disable extra mappings (like EOL commenting)
                },
            })
        end,
    }
}
