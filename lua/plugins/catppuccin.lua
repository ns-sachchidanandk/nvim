return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
            transparent_background = true, -- Enable transparent background
            show_end_of_buffer = false, -- Show '~' characters at the end of buffers
            term_colors = true, -- Use terminal colors
            styles = {
                comments = { "italic" },
                conditionals = { "bold" },
                loops = { "bold" },
                functions = { "bold" },
                keywords = { "italic" },
            },
            integrations = {
                aerial = true,
                alpha = true,
                cmp = true,
                dashboard = true,
                flash = true,
                grug_far = true,
                gitsigns = true,
                headlines = true,
                illuminate = true,
                indent_blankline = { enabled = true },
                leap = true,
                lsp_trouble = true,
                mason = true,
                markdown = true,
                mini = true,
                native_lsp = {
                    enabled = true,
                    underlines = {
                        errors = { "undercurl" },
                        hints = { "undercurl" },
                        warnings = { "undercurl" },
                        information = { "undercurl" },
                    },
                },
                navic = { enabled = true, custom_bg = "lualine" },
                neotest = true,
                neotree = true,
                noice = true,
                notify = true,
                semantic_tokens = true,
                telescope = true,
                treesitter = true,
                treesitter_context = true,
                which_key = true,
                -- Additional useful integrations
                barbar = true, -- Tabline plugin support
                fidget = true, -- LSP progress indicator
                dap = { enabled = true, enable_ui = true }, -- Debugging UI
            },
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd([[colorscheme catppuccin]])
        end,
    },
}
