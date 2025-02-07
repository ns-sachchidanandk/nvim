return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            { "nvim-telescope/telescope-file-browser.nvim" },
        },
        opts = {
            defaults = {
                file_ignore_patterns = { "node_modules", ".git", "dist", "venv", "__pycache__" },
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                mappings = {
                    i = {
                        ["<C-j>"] = "move_selection_next",
                        ["<C-k>"] = "move_selection_previous",
                        -- ["<C-q>"] = "send_selected_to_qflist + open_qflist",
                    },
                    n = {
                        ["q"] = "close",
                        -- ["<C-q>"] = "send_selected_to_qflist + open_qflist",
                    },
                },
            },
            pickers = {
                find_files = { hidden = true },
                live_grep = { additional_args = function() return { "--hidden" } end },
            },
            extensions = {
                file_browser = {
                    hijack_netrw = true,
                },
            },
        },
        config = function(_, opts)
            local telescope = require("telescope")
            telescope.setup(opts)
            telescope.load_extension("fzf")
            telescope.load_extension("file_browser")

            local builtin = require("telescope.builtin")

            -- General pickers
            vim.keymap.set("n", "<leader><space>", builtin.buffers, { desc = "Find open buffers" })
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
            vim.keymap.set("n", "<leader>fa", function() builtin.find_files({ hidden = true }) end, { desc = "Find all files" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
            vim.keymap.set("n", "<leader>fb", builtin.current_buffer_fuzzy_find, { desc = "Find in buffer" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
            vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find recent files" })
            vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find keymaps" })

            -- Git pickers
            vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
            vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
            vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git status" })


            -- File browser
            vim.keymap.set("n", "<leader>e", function()
                require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", select_buffer = true })
            end, { desc = "Open file browser" })
            
            -- Keybinding to copy relative file path
            vim.keymap.set("n", "<leader>cp", function()
                local path = vim.fn.expand("%")
                vim.fn.setreg("+", path) -- Copy to system clipboard
                print("Copied: " .. path)
            end, { desc = "Copy relative file path" })
        end,
    }
}
