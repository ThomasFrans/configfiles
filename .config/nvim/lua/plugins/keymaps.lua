local plugin_telescope = require("telescope.builtin")
local plugin_dap = require("dap")
local plugin_dapui = require("dapui")

vim.keymap.set("n", "<leader>fm", ":TodoTelescope<CR>", { silent = true })
vim.keymap.set("n", "<leader>ff", function()
    plugin_telescope.find_files()
end, { silent = true })
vim.keymap.set("n", "<leader>fw", plugin_telescope.live_grep, { silent = true })
-- BUG: Returns errors, so temporarily disabled!
-- vim.keymap.set("n", "<leader>fh", plugin_telescope.help_tags, { silent = true })
vim.keymap.set(
    "n",
    "<leader><space>",
    plugin_telescope.buffers,
    { silent = true }
)
vim.keymap.set("n", "<F5>", plugin_dap.continue, { silent = true })
vim.keymap.set("n", "<F10>", plugin_dap.step_over, { silent = true })
vim.keymap.set("n", "<F11>", plugin_dap.step_into, { silent = true })
vim.keymap.set("n", "<F12>", plugin_dap.step_out, { silent = true })
vim.keymap.set(
    "n",
    "<leader>b",
    plugin_dap.toggle_breakpoint,
    { silent = true }
)
vim.keymap.set("n", "<F6>", function()
    -- terminateDebuggee = false: Debugger shouldn't terminate process it's
    -- attached to when debugger closes.
    plugin_dap.terminate(nil, { terminateDebuggee = false })
    plugin_dapui.close()
end, { silent = true })
