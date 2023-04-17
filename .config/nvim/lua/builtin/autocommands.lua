vim.api.nvim_create_augroup("autocommands", {})
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    group = "autocommands",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
    group = "autocommands",
    callback = function()
        -- Disable automatic comment when using 'o'.
        vim.opt_local.formatoptions:remove("o")
    end,
})
