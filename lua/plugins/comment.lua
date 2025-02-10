return {
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        opts = function()
            require("Comment").setup({
                padding = true, -- Add a space between comment and text
                sticky = true, -- Keep cursor in place after commenting
                ignore = "^%s*$", -- Ignore empty/whitespace-only lines
                toggler = {
                    line = "gcc", -- Toggle line comment
                    block = "gbc", -- Toggle block comment
                },
                opleader = {
                    line = "gc", -- Operator pending mode for line comment
                    block = "gb", -- Operator pending mode for block comment
                },
                mappings = {
                    basic = true, -- Enable basic mappings
                    extra = true, -- Enable extra mappings (e.g., comment end of line)
                },
                pre_hook = function(ctx)
                    -- Example: integrate with ts-context-commentstring for JSX/TSX
                    local U = require("Comment.utils")
                    local ts_context = require("ts_context_commentstring.integrations.comment_nvim")
                    return ts_context and ts_context.create_pre_hook()(ctx) or nil
                end,
                post_hook = function(ctx)
                    -- Example: refresh diagnostics after commenting
                    vim.defer_fn(function()
                        vim.diagnostic.setloclist({ open = false })
                    end, 100)
                end,
            })
        end,
    }
}
