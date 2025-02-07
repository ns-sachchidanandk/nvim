return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            options = {
                icons_enabled = true,
                theme = "auto", -- Uses current colorscheme
                component_separators = { left = "│", right = "│" }, -- Clean vertical separators
                section_separators = { left = "", right = "" }, -- No bulky section dividers
                disabled_filetypes = { "packer", "NvimTree", "TelescopePrompt" }, -- Hide in special buffers
                always_divide_middle = true,
                globalstatus = true, -- Single statusline across splits
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },
            sections = {
                lualine_a = { "mode" }, -- Show mode (Normal, Insert, etc.)
                lualine_b = { "branch", "diff" }, -- Git branch & diff changes
                lualine_c = {
                    {
                        "filename",
                        path = 1,
                        symbols = { modified = " ●", readonly = " ", unnamed = "[No Name]" },
                        cond = function()
                            return vim.fn.bufname() ~= "" -- Hide if no file is open
                        end,
                    },
                }, -- Show filename with path, but hide if no file is open
                lualine_x = {
                    { "diagnostics", sources = { "nvim_lsp" }, symbols = { error = " ", warn = " ", info = " ", hint = " " } },
                    "encoding",
                    "filetype",
                }, -- Diagnostics, encoding, and filetype
                lualine_y = { "progress" }, -- Show progress in file
                lualine_z = { "location" }, -- Cursor location
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        "filename",
                        path = 1,
                        cond = function()
                            return vim.fn.bufname() ~= "" -- Hide if no file is open
                        end,
                    },
                }, -- Hide filename when inactive if no file is open
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {}, -- Can be customized for buffers/tabs if needed
            winbar = {}, -- Can be used for custom window headers
            inactive_winbar = {},
            extensions = { "quickfix", "nvim-tree", "toggleterm", "fugitive" }, -- Extensions for common plugins
        },
    }
}
