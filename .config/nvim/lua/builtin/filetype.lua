-- Commands that HAVE to be executed LAST for a given filetype.
vim.api.nvim_create_augroup("filetype", {})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = "filetype",
    pattern = { "*.kdl" },
    command = "setfiletype kdl",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = "filetype",
    callback = function()
        -- Disable automatic comment when using 'o'.
        vim.opt.formatoptions:append({ o = false })
    end,
})
