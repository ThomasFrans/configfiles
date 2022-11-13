local function is_lua_project(path)
    local f = io.open(path .. "/init.lua")
    if f ~= nil then
        return true
    else
        return false
    end
end

SetFiletypeKeymaps({
    run_current_buffer = function()
        OpenInTerminal("luajit " .. CurrentBufferPath())
    end,
    run_project = function()
        if is_lua_project(vim.fn.getcwd()) then
            OpenInTerminal("luajit init.lua")
        else
            print("Current working directory is not a lua project...")
        end
    end,
})
