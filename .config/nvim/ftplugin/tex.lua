SetFiletypeKeymaps({
    try_run_current_buffer = function()
        vim.cmd("!latexmk -pdf")
        vim.cmd("!evince *.pdf &")
    end,
    build_project = function()
        vim.cmd("!latexmk -pdf")
    end,
})
