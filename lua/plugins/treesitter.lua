return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate", -- Ensures parsers are updated after install
        opts = {
            auto_install = true, -- Automatically install missing parsers
            sync_install = false, -- Install parsers asynchronously
            ensure_installed = {  -- List of languages to install
                "bash", "c", "cpp", "python", "yaml", "json", "html",
                "css", "javascript", "typescript", "lua", "vim", "markdown",
                "toml", "dockerfile", "gitignore", "regex"
            },
            highlight = {
                enable = true, -- Enable syntax highlighting
                additional_vim_regex_highlighting = false, -- Avoid redundant Vim regex highlighting
            },
            indent = {
                enable = true, -- Enable Treesitter-based indentation
            },
            incremental_selection = {
                enable = true, -- Enable incremental selection
                keymaps = {
                    init_selection = "<CR>",
                    node_incremental = "<CR>",
                    scope_incremental = "<TAB>",
                    node_decremental = "<S-TAB>",
                },
            },
            textobjects = { -- Enable Treesitter text objects
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    }
}
