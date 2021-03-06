--[[
-- The sick top bar
--]]

local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local hotkeys_popup = require("awful.hotkeys_popup")
local beautiful = require("beautiful")
local menubar = require("menubar")

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. gears.filesystem.get_configuration_dir()},
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu(
   { items = {
      { "awesome", myawesomemenu, beautiful.awesome_icon },
      { "open terminal", terminal }
   }
})

mylauncher = awful.widget.launcher({
   image = beautiful.awesome_icon,
   menu = mymainmenu
})

-- Menubar configuration
menubar.utils.terminal = require("configuration.apps").defaults.terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()
-- creates a calendar that goes with the textclock
local month_calendar = awful.widget.calendar_popup.month()
month_calendar:attach(mytextclock, 'tr')
-- Create a wibox for each screen and add it
taglist_buttons = gears.table.join(
   awful.button({ }, 1, function(t) t:view_only() end),

   awful.button({ modkey }, 1, function(t)
      if client.focus then
         client.focus:move_to_tag(t)
      end
   end),

   awful.button({ }, 3, awful.tag.viewtoggle),

   awful.button({ modkey }, 3, function(t)
      if client.focus then
         client.focus:toggle_tag(t)
      end
   end),

   awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),

   awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

batteryarc_widget = require("awesome-wm-widgets.batteryarc-widget.batteryarc")
spotify_shell = require("awesome-wm-widgets.spotify-shell.spotify-shell")
spotify_widget = require("awesome-wm-widgets.spotify-widget.spotify")

tasklist_buttons = gears.table.join(
   awful.button(
      { },
      1,
      function(c)
         if c == client.focus then
            c.minimized = true
         else
            c:emit_signal( "request::activate", "tasklist", {raise = true})
          end
      end
   ),

   awful.button(
      { },
      3,
      function()
         awful.menu.client_list({ theme = { width = 250 } })
      end
   ),

   awful.button(
      { },
      4,
      function()
         awful.client.focus.byidx(1)
      end
   ),

   awful.button(
      { },
      5,
      function()
         awful.client.focus.byidx(-1)
      end
   )
)
