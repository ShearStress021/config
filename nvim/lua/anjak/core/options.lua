vim.g.netrw_banner = 0

vim.opt.termguicolors = true
vim.opt.nu = true
vim.opt.relativenumber = true


-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = false
vim.opt.wrap = false

-- window splits
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.laststatus = 3
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.guicursor = ""
vim.opt.scrolloff = 8

vim.opt.clipboard:append("unnamedplus")
vim.opt.signcolumn = "yes"
vim.o.cmdheight = 0



vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    callback = function()
        vim.hl.on_yank()
    end,
})
