-- Set space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Tell vim I have nerd font
vim.g.have_nerd_font = true

-- Tell vim to use more colors
vim.o.termguicolors = true

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Tabs width
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- Don't show mode
vim.o.showmode = false

-- Enable break indent
vim.o.breakindent = true

-- Enable undo/redo changed even after closing and reopening a file
vim.o.undofile = true

-- Case-insensitive searching unless we specify it
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn by default
vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new split should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Show which line the cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.o.confirm = true

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-on-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
