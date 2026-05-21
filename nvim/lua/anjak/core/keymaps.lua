local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<leader>,", vim.cmd.Ex)


vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search hl", silent = true })

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- tab stuff
vim.keymap.set("n", "<leader>c", "<cmd>tabnew<CR>")   --open new tab
vim.keymap.set("n", "<leader>m", "<cmd>tabp<CR>")     --go to pre


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word cursor is on globally" })
