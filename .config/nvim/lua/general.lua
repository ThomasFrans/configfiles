require "todo-comments".setup {}

---@class FiletypeKeymaps
---@field try_run_current_buffer function
---@field show_runnables function
---@field build_project function
---@field document_project function
---@field document_project_and_open function
---@field check_project function
---@field test_project function
local FiletypeKeymaps = {}

--- Call this to perform specific actions when in a file of a certain filetype,
--- or when in a project.
---@param keymaps FiletypeKeymaps
function SetFiletypeKeymaps(keymaps)
    -- Fields in the input table.
    local try_run_current_buffer = "try_run_current_buffer"
    local show_runnables = "show_runnables"
    local build_project = "build_project"
    local document_project = "document_project"
    local document_project_and_open = "document_project_and_open"
    local check_project = "check_project"
    local test_project = "test_project"

    -- If the current buffer is a runnable script or an executable, run it.
    if (type(keymaps[try_run_current_buffer]) == "function") then
        vim.keymap.set("n", "gr", keymaps[try_run_current_buffer], { noremap = true, silent = true, buffer = 0 })
    end

    -- If there are runnables in the current project (cwd), list them.
    if (type(keymaps[show_runnables]) == "function") then
        vim.keymap.set("n", "<leader>gr", keymaps[show_runnables], { noremap = true, silent = true, buffer = 0 })
    end

    -- If the current project can be built, build it.
    if (type(keymaps[build_project]) == "function") then
        vim.keymap.set("n", "gb", keymaps[build_project], { noremap = true, silent = true, buffer = 0 })
    end

    -- If the current project can be documented, document it.
    if (type(keymaps[document_project]) == "function") then
        vim.keymap.set("n", "gd", keymaps[document_project], { noremap = true, silent = true, buffer = 0 })
    end

    -- If the current project can be documented, document and open it.
    if (type(keymaps[document_project_and_open]) == "function") then
        vim.keymap.set("n", "<leader>gd", keymaps[document_project_and_open],
            { noremap = true, silent = true, buffer = 0 })
    end

    -- If the current project can be checked for code correctness, check it.
    if (type(keymaps[check_project]) == "function") then
        vim.keymap.set("n", "gc", keymaps[check_project], { noremap = true, silent = true, buffer = 0 })
    end

    -- If the current project can be tested, test it.
    if (type(keymaps[test_project]) == "function") then
        vim.keymap.set("n", "gt", keymaps[test_project], { noremap = true, silent = true, buffer = 0 })
    end

end

vim.api.nvim_set_var("Hexokinase_optInPatterns", {
    "full_hex",
    "tripple_hex",
    "rgb",
    "rgba",
    "hsl",
    "hsla",
})

vim.api.nvim_set_var("mapleader", " ")
vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")
vim.cmd("colorscheme gruvbox")

vim.api.nvim_set_keymap("n", "<space>", "<nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>e", ":Ex<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<space>ff", "<cmd>Telescope find_files<cr>", {
    noremap = true,
    silent = true
})
vim.keymap.set("n", "<space>fw", "<cmd>Telescope live_grep<cr>", {
    noremap = true,
    silent = true
})
vim.keymap.set("n", "<space>fm", "<cmd>TodoTelescope keywords=TODO,FIX,HACK,BUG<CR>", {
    noremap = true,
    silent = true
})

vim.cmd([[
	hi WinSeparator guibg=None
	hi ColorColumn guibg=gray30
    hi Normal guibg=None
]])

vim.cmd([[
    let g:lightline = {
        \ "active": {
        \       "left": [ [ "mode", "paste" ], [ "readonly", "absolutepath", "modified" ] ],
        \     }
        \     }
]])
