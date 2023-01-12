local telescope_pickers = require("telescope.builtin")

---Return the absolute path to the file opened in the current buffer.
---@return string
function CurrentBufferPath()
    return vim.fn.getcwd() .. "/" .. vim.fn.bufname()
end

---Returns the name of the file in `path`.
---@param path string
-- TODO: Doesn't work at all!
function FilenameFromPath(path)
    -- return path:match("^/?([^/]+/)*([^%./]+)(%.[^/]+)*$")
    local extention = path:match("[^%.]*$")
    local path_without_extention = path:sub(0, #path - 1 - #extention)
    return path_without_extention:match("[^/]*$")
end

---Open `command` in the builtin terminal.
---@param command string
function OpenInTerminal(command)
    -- Create a new window at the bottom.
    vim.cmd("split")

    -- Create a throwaway buffer for displaying the terminal.
    local temp_buffer = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_win_set_buf(0, temp_buffer)

    -- Open the terminal in the new window that contains the throwaway buffer.
    vim.fn.termopen(command)
end

---@class FiletypeKeymaps
---@field run_current_buffer function Try to run the current buffer.
---@field show_project_runnables function Show all the runnables in the current project.
---@field run_project function Run the project.
---@field build_project function Build the project.
---@field document_project function Document the project.
---@field document_project_and_open function Document the project and open.
---@field check_project function Check the project.
---@field test_project function Test the project.
local FiletypeKeymaps = {}

---Perform specific actions with the same keymaps, depending on the
---filetype/project.
---@param keymaps FiletypeKeymaps
function SetFiletypeKeymaps(keymaps)
    -- Fields in the input table.
    local run_current_buffer = "run_current_buffer"
    local show_project_runnables = "show_project_runnables"
    local run_project = "run_project"
    local build_project = "build_project"
    local document_project = "document_project"
    local document_project_and_open = "document_project_and_open"
    local check_project = "check_project"
    local test_project = "test_project"

    -- If the current buffer is a runnable script or an executable, run it.
    if (type(keymaps[run_current_buffer]) == "function") then
        vim.keymap.set("n", "<leader>pr", keymaps[run_current_buffer], { silent = true, buffer = true })
    end

    -- If the current project can be run, run it.
    if (type(keymaps[run_project]) == "function") then
        vim.keymap.set("n", "<leader>pR", keymaps[run_project], { silent = true, buffer = true })
    end

    -- -- If there are runnables in the current project (cwd), list them.
    -- if (type(keymaps[show_project_runnables]) == "function") then
    --     vim.keymap.set("n", "<leader>gpr", keymaps[show_project_runnables], { silent = true, buffer = true })
    -- end

    -- If the current project can be built, build it.
    if (type(keymaps[build_project]) == "function") then
        vim.keymap.set("n", "<leader>pb", keymaps[build_project], { silent = true, buffer = true })
    end

    -- If the current project can be documented, document it.
    if (type(keymaps[document_project]) == "function") then
        vim.keymap.set("n", "<leader>pd", keymaps[document_project], { silent = true, buffer = true })
    end

    -- If the current project can be documented, document and open it.
    if (type(keymaps[document_project_and_open]) == "function") then
        vim.keymap.set("n", "<leader>pD", keymaps[document_project_and_open],
            { silent = true, buffer = true })
    end

    -- If the current project can be checked for code correctness, check it.
    if (type(keymaps[check_project]) == "function") then
        vim.keymap.set("n", "<leader>pC", keymaps[check_project], { silent = true, buffer = true })
    end

    -- If the current project can be tested, test it.
    if (type(keymaps[test_project]) == "function") then
        vim.keymap.set("n", "<leader>pt", keymaps[test_project], { silent = true, buffer = true })
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

vim.keymap.set("n", "<space>", "<nop>", { silent = true })
vim.keymap.set("n", "<leader>e", ":Ex<CR>", { silent = true })
vim.keymap.set("n", "<leader>ff", telescope_pickers.find_files, { silent = true })
vim.keymap.set("n", "<leader>fw", telescope_pickers.live_grep, { silent = true })
vim.keymap.set("n", "<leader>fm", "<cmd>TodoTelescope keywords=TODO,FIX,HACK,BUG<CR>", { silent = true })
vim.keymap.set("n", "<leader><space>", telescope_pickers.buffers, { silent = true })
vim.keymap.set("n", "<leader>fs", telescope_pickers.lsp_document_symbols, { silent = true })

vim.cmd([[
	hi WinSeparator guibg=None
	hi ColorColumn guibg=gray30
    hi Normal guibg=None
]])
