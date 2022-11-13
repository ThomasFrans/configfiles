local dap = require "dap"
local dapui = require "dapui"

vim.keymap.set("n", "<F5>", dap.continue, { noremap = true, silent = true })
vim.keymap.set("n", "<F10>", dap.step_over, { noremap = true, silent = true })
vim.keymap.set("n", "<F11>", dap.step_into, { noremap = true, silent = true })
vim.keymap.set("n", "<F12>", dap.step_out, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)

dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

dap.adapters.lldb =
{
    type = "executable",
    command = "/usr/bin/lldb-vscode",
    name = "lldb"
}

dap.configurations.cpp =
{
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
    },
    {
        -- If you get an "Operation not permitted" error using this, try disabling YAMA:
        --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        name = "Attach to process",
        type = "lldb", -- Adjust this to match your adapter name (`dap.adapters.<name>`)
        request = "attach",
        pid = require("dap.utils").pick_process,
        args = {},
    },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
dap.configurations.rust[1]["program"] = function() return vim.fn.input("Executable: ",
    vim.fn.getcwd() .. "/target/debug/", "file") end
