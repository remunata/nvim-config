-- Clear highlights on search when pressing <esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Keybinds to make split navigation easier.
vim.keymap.set({ "n", "t" }, "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set({ "n", "t" }, "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set({ "n", "t" }, "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set({ "n", "t" }, "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Buffer navigation
vim.keymap.set("n", "L", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "H", "<cmd>bprev<CR>", { desc = "Previous buffer" })

-- Window control
vim.keymap.set({ "n", "t" }, "<C-Up>", "<cmd>resize +2<CR>", { silent = true })
vim.keymap.set({ "n", "t" }, "<C-Down>", "<cmd>resize -2<CR>", { silent = true })
vim.keymap.set({ "n", "t" }, "<C-Left>", "<cmd>vertical resize -2<CR>", { silent = true })
vim.keymap.set({ "n", "t" }, "<C-Right>", "<cmd>vertical resize +2<CR>", { silent = true })

-- Remap for dealing with line wrap
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { silent = true, expr = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { silent = true, expr = true })

-- Toggle autoformat status
vim.keymap.set("n", "<leader>FT", function()
	vim.g.disable_autoformat = not vim.g.disable_autoformat
	vim.notify("Format on save (global): " .. (vim.g.disable_autoformat and "off" or "on"))
end, { desc = "Toggle format on save (all buffers)" })

vim.keymap.set("n", "<leader>Ft", function()
	vim.b.disable_autoformat = not vim.b.disable_autoformat
	vim.notify("Format on save (this buffer): " .. (vim.b.disable_autoformat and "off" or "on"))
end, { desc = "Toggle format on save (current buffer)" })
