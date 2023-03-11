vim.api.nvim_create_augroup("autocommands", {})
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    group = "autocommands",
    command = "silent! lua vim.highlight.on_yank({higroup=\"IncSearch\", timeout=200})",
})
