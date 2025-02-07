return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = function()
            require("nvim-autopairs").setup({
                check_ts = true, -- Treesitter integration
                disable_filetype = { "TelescopePrompt", "vim" },
            })
        end,
    }
}
