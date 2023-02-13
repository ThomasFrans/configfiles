local plugin_telescope = require("telescope.builtin")
local plugin_dap = require("dap")

vim.keymap.set("n", "<leader>fm", ":TodoTelescope<CR>")
vim.keymap.set("n", "<leader>ff", function() plugin_telescope.find_files({ hidden = true }) end)
vim.keymap.set("n", "<leader>fw", plugin_telescope.live_grep)
-- BUG: Returns errors, so temporarily disabled!
-- vim.keymap.set("n", "<leader>fh", plugin_telescope.help_tags)
vim.keymap.set("n", "<leader><space>", plugin_telescope.buffers)
vim.keymap.set("n", "<F5>", plugin_dap.continue)
vim.keymap.set("n", "<F10>", plugin_dap.step_over)
vim.keymap.set("n", "<F11>", plugin_dap.step_into)
vim.keymap.set("n", "<F12>", plugin_dap.step_out)
vim.keymap.set("n", "<leader>b", plugin_dap.toggle_breakpoint)