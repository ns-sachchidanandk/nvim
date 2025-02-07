-- General Settings
vim.opt.undofile = true --> Enable persistent undo

-- UI & Display
vim.opt.number = true --> Enable line numbers
vim.opt.relativenumber = true --> Enable relative line numbers
vim.opt.numberwidth = 2
vim.opt.cursorline = true --> Highlight the current line
-- vim.opt.signcolumn = "yes" --> Always show the sign column
-- vim.opt.colorcolumn = "120" --> Highlight column at 80 characters
vim.opt.textwidth = 132 --> Automatically wrap text at 80 characters
vim.opt.scrolloff = 8 --> Keep 5 lines of context above/below the cursor
vim.opt.sidescrolloff = 8 --> Keep 8 columns of context on the left/right

-- Tabs & Indentation
vim.opt.tabstop = 4 --> Set tab width to 4 spaces
vim.opt.shiftwidth = 4 --> Indentation width
vim.opt.softtabstop = 4 --> Spaces per tab when editing
vim.opt.expandtab = true --> Convert tabs to spaces
vim.opt.autoindent = true --> Enable automatic indentation
vim.opt.smartindent = true --> Enable smart indentation

-- Search & Navigation
vim.opt.ignorecase = true --> Ignore case in searches
vim.opt.smartcase = true --> Override ignorecase if uppercase is used
vim.opt.incsearch = true --> Show search results as you type
vim.opt.hlsearch = true --> Highlight search results
vim.opt.wrap = true --> Enable line wrapping
vim.opt.linebreak = true --> Wrap lines at word boundaries

-- Performance & Behavior
vim.opt.updatetime = 300 --> Reduce time before CursorHold event triggers
vim.opt.timeoutlen = 500 --> Time in milliseconds to wait for key sequence
vim.opt.ttimeoutlen = 10 --> Time for key code sequences
vim.opt.lazyredraw = false --> Do not optimize redrawing performance

-- Completion & Autocomplete
vim.opt.completeopt = { "menuone", "noselect" } --> Better completion menu behavior
vim.opt.pumheight = 10 --> Limit popup menu height
vim.opt.wildmenu = true --> Enable command-line completion
vim.opt.wildmode = "longest:full,full" --> Completion behavior

-- Mouse & Clipboard
vim.opt.mouse = "a" --> Enable mouse support
vim.opt.clipboard = "unnamedplus" --> Use system clipboard
vim.opt.termguicolors = true --> Enable true color support

-- Splits & Window Management
vim.opt.splitbelow = true  --> New horizontal splits open below
vim.opt.splitright = true  --> New vertical splits open to the right
