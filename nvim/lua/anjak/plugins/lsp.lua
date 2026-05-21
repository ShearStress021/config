require("mason").setup()




local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format Local buffer" })
vim.keymap.set("n", "df", vim.diagnostic.open_float, { desc = "Show line diagnostics" })


if cmp_lsp_ok then
    capabilities = cmp_nvim_lsp.default_capabilities()
end

if capabilities.textDocument and capabilities.textDocument.completion then
    capabilities.textDocument.completion.completionItem.snippetSupport = false
end



vim.diagnostic.config({ virtual_text = true })

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
        },
    },
})
vim.lsp.config["clangd"] = {
    cmd = { "clangd", "--background-index", "--clang-tidy" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
    capabilities = capabilities,
    root_markers = { "compile_commands.json", "compile_flags.txt", ".git" },
}
local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
    }),

    snippet = {
        expand = function() end -- no-op
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
    }),
})

vim.lsp.enable({
    "lua_ls",
    "clangd"
})
