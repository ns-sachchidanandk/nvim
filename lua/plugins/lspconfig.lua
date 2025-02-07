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

            -- Keybindings for LSP (with vertical split support)
            local keymap = vim.keymap.set
            keymap("n", "gd", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", { desc = "Go to Definition (vsplit)" })
            keymap("n", "gr", "<cmd>vsplit | lua vim.lsp.buf.references()<CR>", { desc = "Find References (vsplit)" })
            keymap("n", "gD", "<cmd>vsplit | lua vim.lsp.buf.declaration()<CR>", { desc = "Go to Declaration (vsplit)" })
            keymap("n", "gi", "<cmd>vsplit | lua vim.lsp.buf.implementation()<CR>", { desc = "Go to Implementation (vsplit)" })
            keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
            keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
        end,
    },
}
