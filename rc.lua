pcall(require, "luarocks.loader")

require("awful.autofocus")

require("module.admin")
require("module.defineLayouts")
require("module.setDefaults")
require("module.bindings")
require("module.rules")

require("beautiful").init(require("gears").filesystem.get_configuration_dir() .. "/themes/macos-dark/theme.lua")

-- consists of bar stuff in layout.screen.
require("widget.widgets")
require("layout.screen")
require("module.otherSignals")

-- call autostart script.
require("module.autostart")
