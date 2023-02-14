vim.api.nvim_create_augroup("filetype", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.kdl" },
    group = "general",
    command = "setfiletype kdl",
})
