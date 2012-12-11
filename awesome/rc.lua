-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")

-- Theme handling library
require("beautiful")

-- Menu icons
require("freedesktop.utils")
require("freedesktop.menu")

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init("/home/ahmed/.config/awesome/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "urxvt"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
  awful.layout.suit.tile,        -- 1
  --awful.layout.suit.tile.left,   -- 2
  awful.layout.suit.tile.bottom, -- 2
  --awful.layout.suit.tile.top,    -- 4
  awful.layout.suit.max,         -- 3
  --awful.layout.suit.magnifier,   -- 6
  awful.layout.suit.floating     -- 4
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {
  names  = { "coding", "web", "media", "writing", "reading", 6, 7, "im",
	     "mail/rss" },
  --names = { "⠐", "⠡", "⠪", "⠵", "⠻", "⠿" },
  layout = { layouts[1], layouts[4], layouts[4], layouts[1], layouts[1],
             layouts[4], layouts[1], layouts[4], layouts[3]
}}

for s = 1, screen.count() do
    tags[s] = awful.tag(tags.names, s, tags.layout)
    awful.tag.setproperty(tags[s][6], "hide",   true)
    awful.tag.setproperty(tags[s][7], "hide",   true)
end
-- }}}

-- {{{ Menu
freedesktop.utils.terminal = terminal  -- default: "urxvt"
freedesktop.utils.icon_theme = { "Faenza-Darkest", "Faenza-Darker", "Faenza-Dark", "Faenza", "gnome" } -- look inside /usr/share/icons/
menu_items = freedesktop.menu.new()
table.insert(menu_items, { "Open terminal", terminal, freedesktop.utils.lookup_icon({icon = 'terminal'}) })
table.insert(menu_items, { "Session dialog", function() awful.util.spawn("session-dialog.sh") end, freedesktop.utils.lookup_icon({icon = 'system-log-out'}) })
mymainmenu = awful.menu({ items = menu_items, width = 150 })

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),menu = mymainmenu })
-- }}}

-- {{{ Wibox

-- {{{ Reusable separators
spacer    = widget({ type = "textbox"  })
separator = widget({ type = "imagebox" })
spacer.text     = " "
separator.image = image(beautiful.widget_sep)
-- }}}

-- Create a textclock widget
mytextclock = awful.widget.textclock({ align = "right" }, "%A %d %B, %Y %H:%M")
-- Create a systray
mysystray = widget({ type = "systray" })
-- end

-- Create a wibox for each screen and add it
bottompanel = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
				     if not c:isvisible() then
					awful.tag.viewonly(c:tags()[1])
				     end
				     client.focus = c
				     c:raise()
                                          end),
                     awful.button({ }, 3, function ()
				     if instance then
					instance:hide()
					instance = nil
				     else
					instance = awful.menu.clients({ width=250 })
				     end
                                          end),
                     awful.button({ }, 4, function ()
				     awful.client.focus.byidx(1)
				     if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
				     awful.client.focus.byidx(-1)
				     if client.focus then client.focus:raise() end
                                          end))


for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
          awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
	  awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
	  awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
	  awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)
    ))

    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(
        function(c)
           return awful.widget.tasklist.label.currenttags(c, s)
        end, mytasklist.buttons)

    -- Create the wibox
    bottompanel[s] = awful.wibox({ position = "bottom", screen = s, fg = beautiful.fg_normal, bg = bg_normal })

    -- Add widgets to the wibox - order matters
    bottompanel[s].widgets = {
        {
          mylauncher,
	  spacer,
          mytaglist[s],
          --spacer,
          mylayoutbox[s],
          spacer,
          mypromptbox[s],
          space,
          layout = awful.widget.layout.horizontal.leftright
        },
	spacer,
        mytextclock,
	spacer,
        s == 1 and mysystray or nil,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ "Control"         }, "Escape", function () awful.util.spawn("i3lock")             end),
    awful.key({ modkey,           }, "a",      function () awful.util.spawn("pcmanfm")           end),
    awful.key({ modkey, "Shift"   }, "Return", function () awful.util.spawn(terminal)            end),
    awful.key({ modkey, "Shift"   }, "q",      function () awful.util.spawn("session-dialog.sh") end),
    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",      function (c) c.minimized = not c.minimized    end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                        hidetags()
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                      hidetags()
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                      hidetags()
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                      hidetags()
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- generate and add the 'run or raise' key bindings to the globalkeys table
--globalkeys = awful.util.table.join(globalkeys, aweror.genkeys(modkey))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = false,
                     keys = clientkeys,
                     maximized_vertical = false,
                     maximized_horizontal = false,
		     size_hints_honor = false,
                     buttons = clientbuttons } },
--    { rule = { class = "MPlayer" },
--     properties = { floating = true } },
--    { rule = { class = "pinentry" },
--     properties = { floating = true } },
    { rule = { type = "dialog" },
     properties = { focus = true } },
    { rule = { class = "gimp" },
     properties = { floating = true } },
    { rule = { class = "Npviewer.bin" },
     properties = { floating = true } },
    { rule = { class = "Exe"          },
     properties = { floating = true } },
    { rule = { class = "Gxmessage"    },
     properties = { floating = true,
                    focus = true    } }
    -- Set Firefox to always map on tags number 2 of screen 1.
    --{ rule = { class = "opera" },
     --properties = { tag = tags[1][2] } }
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
          awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus",
    function(c)
        c.border_color = beautiful.border_focus 
--        c.opacity = 1
    end)
client.add_signal("unfocus",
    function(c)
        c.border_color = beautiful.border_normal
--        c.opacity = 0.7
    end)
-- }}}

-- }}}
function hidetags()
   curtags = awful.tag.selectedlist()

   for i,t in ipairs(tags[mouse.screen]) do
      if #(t:clients()) == 0 or t.name == "6" or t.name == "7" then
         awful.tag.setproperty(t, "hide", true)
      else
         awful.tag.setproperty(t, "hide", false)
      end
   end

   for _,t in ipairs(curtags) do
      if t.name ~= "6" and t.name ~= "7" then
         awful.tag.setproperty(t, "hide", false)
      end
   end
end

hidetags()
-- }}}
