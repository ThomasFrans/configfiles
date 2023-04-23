require("util").bootstrap_plugin_manager()

require("lazy").setup("plugins.plugin_specs", {
    change_detection = {
        notify = false,
    },
})
