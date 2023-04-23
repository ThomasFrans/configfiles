local M = {}

-- stylua: ignore
M.setup_lsp_buffer_keymaps = function (_, bufnr)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, silent = true })
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = bufnr, silent = true })
    vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, { buffer = bufnr, silent = true })
    vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { buffer = bufnr, silent = true })
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { buffer = bufnr, silent = true })
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = bufnr, silent = true })
    vim.keymap.set("n", "<leader>dd", "<cmd>Telescope diagnostics<cr>", { buffer = bufnr, silent = true })
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = bufnr, silent = true })
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { buffer = bufnr, silent = true })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { buffer = bufnr, silent = true })
    vim.keymap.set("n", "<leader>si", vim.lsp.buf.incoming_calls, { buffer = bufnr, silent = true, desc = "[S]how [i]ncoming calls." })
    vim.keymap.set("n", "<leader>so", vim.lsp.buf.outgoing_calls, { buffer = bufnr, silent = true, desc = "[S]how [o]utgoing calls." })
end

M.lsp_client_capabilities = function()
    require("cmp_nvim_lsp").default_capabilities()
end

--- Install the plugin manager if it isn't installed yet.
M.bootstrap_plugin_manager = function()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)
end

return M
