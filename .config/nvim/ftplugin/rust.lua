local api = vim.api;

-- api.nvim_create_augroup("RustBufWritePost", {clear = true})
-- api.nvim_create_autocmd({"BufUnload"}, {
--     command = "silent! !cargo fmt"
-- })

local function run()
    vim.cmd("!cargo run")
end

local function build()
    vim.cmd("!cargo build")
end

local function check()
    vim.cmd("!cargo check")
end

local function document()
    vim.cmd("!cargo doc")
end

local function test()
    vim.cmd("!cargo test")
end

vim.keymap.set('n', "<leader>gr", run, {noremap=true, silent=true, buffer=0})
vim.keymap.set('n', "<leader>gb", build, {noremap=true, silent=true, buffer=0})
vim.keymap.set('n', "<leader>gc", check, {noremap=true, silent=true, buffer=0})
vim.keymap.set('n', "<leader>gd", document, {noremap=true, silent=true, buffer=0})
vim.keymap.set('n', "<leader>gt", test, {noremap=true, silent=true, buffer=0})
