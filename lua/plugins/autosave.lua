return {
    {
        "pocco81/auto-save.nvim",
        config = function()
            require("auto-save").setup({
                enabled = true,
                execution_message = {
                    message = function() return "Changes Saved" end, -- No message on save
                },
                events = { "InsertLeave", "TextChanged" },
                conditions = {
                    exists = true,
                    filetype_is_not = { "neo-tree", "lazy", "dashboard" }, -- Ignore specific filetypes
                    modifiable = true,
                },
            })
        end,
    }
}
