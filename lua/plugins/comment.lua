return {
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPost", "BufNewFile" }, -- Load when opening a file
        opts = {
            padding = true,
            sticky = true,
            ignore = "^%s*$",
            toggler = {
                line = "gcc",
                block = "gbc",
            },
            opleader = {
                line = "gc",
                block = "gb",
            },
            mappings = {
                basic = true,
                extra = true,
            },
            pre_hook = function(ctx)
                local ts_context = require("ts_context_commentstring.integrations.comment_nvim")
                return ts_context and ts_context.create_pre_hook()(ctx) or nil
            end,
            post_hook = function(ctx)
                vim.defer_fn(function()
                    vim.diagnostic.setloclist({ open = false })
                end, 100)
            end,
        },
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = false,
        opts = { enable_autocmd = false },
    },
}
