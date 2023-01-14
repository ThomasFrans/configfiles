local plugin_telescope = require("telescope.builtin")

vim.keymap.set("n", "<leader>fm", ":TodoTelescope<CR>")
vim.keymap.set("n", "<leader>ff", plugin_telescope.find_files)
vim.keymap.set("n", "<leader>fw", plugin_telescope.live_grep)
vim.keymap.set("n", "<leader><space>", plugin_telescope.buffers)
