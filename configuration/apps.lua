return {
    run_on_start_up = {
        os.getenv("HOME") .. "/.config/autostart"
    },
    defaults = {
        terminal = "kitty",
        editor = "nvim",
        modkey = "Mod4"
    }
}
