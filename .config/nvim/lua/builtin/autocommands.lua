vim.api.nvim_create_augroup("general", { clear = true })
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    group = "general",
    command = "silent! lua vim.highlight.on_yank({higroup=\"IncSearch\", timeout=200})",
})
