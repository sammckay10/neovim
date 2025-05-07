-- File handling
vim.opt.backup = false -- don't create backup files (~) when writing
vim.opt.swapfile = false -- don't create swap files (.swp)
vim.opt.writebackup = false -- don't make a backup before overwriting a file
vim.opt.undofile = true -- keep undo history between sessions
vim.opt.fileformats = "unix" -- only recognize unix line endings (lf)

-- Clipboard
vim.opt.clipboard = "unnamedplus" -- use system clipboard by default for y/yank, d/delete, p/paste

-- UI
vim.opt.fillchars = { eob = " " } -- replace ~ at end-of-buffer with spaces
vim.opt.scrolloff = 999 -- keep cursor centered vertically (very aggressive; performance heavy)
vim.opt.showmode = false -- don't show -- insert -- etc (statusline usually handles this)
vim.opt.termguicolors = true -- enable truecolor support
vim.opt.wrap = false -- don't wrap long lines
vim.opt.title = true -- enable terminal title updates
vim.opt.titlelen = 0 -- no limit on terminal title length
vim.opt.titlestring = "nvim - %t" -- set terminal title to include filename

-- Editing
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.tabstop = 4 -- number of spaces per tab
vim.opt.shiftwidth = 4 -- number of spaces to use for autoindent
vim.opt.ignorecase = true -- case-insensitive search by default
vim.opt.infercase = true -- adjust case in completions based on typed text
vim.opt.hlsearch = false -- don't highlight search results after search ends

-- Performance
vim.opt.lazyredraw = true -- don't redraw during macros/commands for speed
vim.opt.redrawtime = 1000 -- max time (ms) for syntax highlighting redraw
vim.opt.synmaxcol = 120 -- stop syntax highlighting after 120 columns

-- Splits
vim.opt.splitbelow = true -- horizontal splits open below the current window
vim.opt.splitright = true -- vertical splits open to the right of current window

-- spell checking / language
vim.opt.spelllang = "en_gb" -- use british english dictionary for spell checking
