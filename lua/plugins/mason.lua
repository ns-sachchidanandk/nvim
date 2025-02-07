return {
    -- 🌟 Mason (LSP Installer)
    {
        "williamboman/mason.nvim",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        opts = {
            ensure_installed = {
                "bashls",
                "yamlls",
                "lua_ls",
                "clangd", -- C, C++
                "pyright", -- Python
            },
        },
        config = function(_, opts)
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = opts.ensure_installed,
                automatic_installation = true,
            })

            -- 🌟 Keybinding for Mason UI
            vim.keymap.set("n", "<leader>lm", "<cmd>Mason<CR>", { desc = "Open Mason UI" })
        end,
    },
}
