-- Clear highlights on search when pressing <esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Keybinds to make split navigation easier.
vim.keymap.set({ "n", "t" }, "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set({ "n", "t" }, "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set({ "n", "t" }, "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set({ "n", "t" }, "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "L", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "H", "<cmd>bprev<CR>", { desc = "Previous buffer" })
