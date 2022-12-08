SetFiletypeKeymaps({
    run_current_buffer = function() OpenInTerminal("cargo run " .. vim.fn.input("cargo run ")) end,
    show_runnables = function() vim.cmd('RustRunnables') end,
    build_project = function() vim.cmd('!cargo build') end,
    document_project = function() vim.cmd('!cargo doc') end,
    document_project_and_open = function() vim.cmd('!cargo doc --open') end,
    check_project = function() vim.cmd('!cargo check') end,
    test_project = function() vim.cmd('!cargo test') end,
})

-- Disable auto comment on next line when pressing o.
vim.opt_local.formatoptions = "jtcrql"
