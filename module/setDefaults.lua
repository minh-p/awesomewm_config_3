local defaults = require("configuration.apps").defaults

terminal = defaults.terminal
editor = os.getenv("EDITOR") or defaults.editor
editor_cmd = terminal .. " -e " .. editor
modkey = defaults.modkey
