
local function run()
    vim.cmd("!cargo run")
end

local function build()
    vim.cmd("!cargo build")
end

local function check()
    vim.cmd("!cargo check")
end

vim.keymap.set('n', "<leader>gr", run, {noremap=true, silent=true, buffer=0})
vim.keymap.set('n', "<leader>gb", build, {noremap=true, silent=true, buffer=0})
vim.keymap.set('n', "<leader>gc", check, {noremap=true, silent=true, buffer=0})

