return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            { "rcarriga/nvim-notify", module = "notify" }, -- Ensure notify loads correctly
        },
        opts = {
            cmdline = {
                enabled = true,
                view = "cmdline", -- Display command line in Noice UI
            },
            messages = {
                enabled = true,
                view = "mini", -- Compact message display
                view_error = "notify", -- Show errors in notify
                view_warn = "notify", -- Show warnings in notify
                view_history = "messages", -- Store history of messages
            },
            popupmenu = {
                enabled = true,
                backend = "nui", -- Use Nui popup for command menu
            },
            lsp = {
                progress = { enabled = true }, -- Show LSP progress notifications
                hover = { enabled = true, silent = false }, -- Replace native LSP hover
                signature = { enabled = true }, -- Enable LSP signature help
                message = { enabled = true, view = "mini" }, -- Compact LSP messages
            },
            presets = {
                bottom_search = true, -- Classic bottom search UI
                command_palette = true, -- Popup-based command line UI
                long_message_to_split = true, -- Send long messages to split
                inc_rename = false, -- Disable input rename UI
                lsp_doc_border = true, -- Add borders to LSP popups
            },
        },
        config = function(_, opts)
            require("noice").setup(opts)

            -- 🌟 Catppuccin Theme Support for Noice
            require("catppuccin").setup({
                integrations = {
                    noice = true, -- Enable Noice styling in Catppuccin
                    notify = true, -- Use Catppuccin for notifications
                },
            })

            -- 🌟 Useful Keybindings for Noice
            vim.keymap.set("n", "<leader>nd", "<cmd>Noice dismiss<cr>", { desc = "Dismiss notifications" })
            vim.keymap.set("n", "<leader>nh", "<cmd>Noice history<cr>", { desc = "View message history" })
            vim.keymap.set("n", "<leader>nl", "<cmd>Noice last<cr>", { desc = "Show last message" })
        end,
    }
}
