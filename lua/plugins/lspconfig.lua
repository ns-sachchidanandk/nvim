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

            -- Function to check if the current buffer is already open in a split
            local function open_or_focus_split(cmd)
                local winid = vim.fn.bufwinid(vim.fn.expand("<cword>"))
                if winid ~= -1 then
                    vim.api.nvim_set_current_win(winid)
                else
                    vim.cmd(cmd)
                end
            end

            -- Keybindings for LSP (smart split handling)
            local keymap = vim.keymap.set
            keymap("n", "gd", function() open_or_focus_split("vsplit | lua vim.lsp.buf.definition()") end, { desc = "Go to Definition (smart vsplit)" })
            keymap("n", "gr", function() open_or_focus_split("vsplit | lua vim.lsp.buf.references()") end, { desc = "Find References (smart vsplit)" })
            keymap("n", "gD", function() open_or_focus_split("vsplit | lua vim.lsp.buf.declaration()") end, { desc = "Go to Declaration (smart vsplit)" })
            keymap("n", "gi", function() open_or_focus_split("vsplit | lua vim.lsp.buf.implementation()") end, { desc = "Go to Implementation (smart vsplit)" })
            keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
            keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
        end,
    },
}

