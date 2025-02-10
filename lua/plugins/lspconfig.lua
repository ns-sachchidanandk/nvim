return {
    -- 🌟 LSP Config
    {
        "neovim/nvim-lspconfig",
        dependencies = { "hrsh7th/cmp-nvim-lsp" },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Configure LSP servers
            local servers = { "clangd", "pyright", "bashls", "yamlls", "lua_ls" }
            for _, server in ipairs(servers) do
                lspconfig[server].setup({
                    capabilities = capabilities,
                })
            end

            -- Function to check if a buffer is already open in a split
            local function goto_or_open_split(lsp_func)
                local params = vim.lsp.util.make_position_params()
                vim.lsp.buf_request(0, lsp_func, params, function(err, result, ctx, _)
                    if err or not result or vim.tbl_isempty(result) then return end
                    local target_uri = result[1].uri or result.uri
                    local target_bufnr = vim.uri_to_bufnr(target_uri)

                    -- Check if buffer is already open in a window
                    for _, win in ipairs(vim.api.nvim_list_wins()) do
                        if vim.api.nvim_win_get_buf(win) == target_bufnr then
                            vim.api.nvim_set_current_win(win)
                            return
                        end
                    end
                    -- If not open, create a split and open it
                    vim.cmd("vsplit")
                    vim.lsp.util.jump_to_location(result[1], "utf-8")
                end)
            end

            -- Keybindings for LSP (smart split handling)
            local keymap = vim.keymap.set
            keymap("n", "gd", function() goto_or_open_split("textDocument/definition") end, { desc = "Go to Definition (smart vsplit)" })
            keymap("n", "gr", function() goto_or_open_split("textDocument/references") end, { desc = "Find References (smart vsplit)" })
            keymap("n", "gD", function() goto_or_open_split("textDocument/declaration") end, { desc = "Go to Declaration (smart vsplit)" })
            keymap("n", "gi", function() goto_or_open_split("textDocument/implementation") end, { desc = "Go to Implementation (smart vsplit)" })
            keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
            keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
        end,
    },
}

