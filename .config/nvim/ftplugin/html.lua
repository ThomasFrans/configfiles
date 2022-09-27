local function run()
    vim.cmd("!cargo run")
end

vim.keymap.set('n', "<leader>gr", run, {noremap=true, silent=true, buffer=0})
