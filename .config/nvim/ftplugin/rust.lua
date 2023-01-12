SetFiletypeKeymaps({
    run_current_buffer = function()
        local filename = FilenameFromPath(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))
        -- Entry point to my Vim config ig? :p
        if filename == "main" then
            -- FIX: Doesn't work for projects with multiple binaries!
            OpenInTerminal("cargo run")
        else
            OpenInTerminal("cargo run --bin " .. filename)
        end
    end,
    show_project_runnables = function() vim.cmd('RustRunnables') end,
    build_project = function() vim.cmd('!cargo build') end,
    document_project = function() vim.cmd('!cargo doc') end,
    document_project_and_open = function() vim.cmd('!cargo doc --open') end,
    check_project = function() vim.cmd('!cargo check') end,
    test_project = function() vim.cmd('!cargo test') end,
})

vim.opt_local.textwidth = 80
vim.opt_local.formatoptions = "jcrql"
