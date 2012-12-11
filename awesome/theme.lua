-- {{{ Main
theme = {}
theme.confdir       = awful.util.getdir("config")
theme.wallpaper_cmd = { "sh wallpaper.sh" }
-- }}}

-- {{{ Styles
theme.font      = "mikachan 7"
--theme.font      = "snap 6"
--theme.font      = "Profont 8"

-- {{{ Colors
theme.fg_normal     = "#DCDCCC"
theme.fg_focus      = "#DCDCCC"
theme.fg_urgent     = "#5fa496"
theme.fg_minimize   = "#000000"
theme.bar 	    = "#6568bf"

theme.bg_normal     = "#2B2B2B"
theme.bg_focus      = "#2b2b2b"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#000000"
-- }}}

-- {{{ Borders
theme.border_width  = "1"
theme.border_normal = "#30314F"
theme.border_focus  = "#3F7B6F"
theme.border_marked = "#000000"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = theme.bg_normal
theme.titlebar_bg_normal = theme.bg_normal
-- }}}

theme.menu_height = "15"
theme.menu_width  = "100"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
theme.taglist_bg_focus = theme.bg_normal
theme.taglist_bg = theme.bg_normal
-- }}}

-- {{{ Widgets
--theme.fg_widget        = theme.fg_normal
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.fg_off_widget    = "#494B4F"
--theme.fg_netup_widget  = "#7F9F7F"
--theme.fg_netdn_widget  = theme.fg_urgent
theme.bg_widget        = theme.bg_normal
--theme.border_widget    = theme.bg_normal
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = theme.fg_urgent
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
--theme.menu_height = "15"
--theme.menu_width  = "100"
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = theme.confdir .. "/icons.zenburn/taglist/squarefz.png"
theme.taglist_squares_unsel = theme.confdir .. "/icons.zenburn/taglist/squareza.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = theme.confdir .. "/icons.zenburn/archlinux.png"
theme.menu_submenu_icon      = "/usr/share/awesome/themes/default/submenu.png"
theme.tasklist_floating_icon = "/usr/share/awesome/themes/default/tasklist/floatingw.png"
-- }}}

-- {{{ Layout

theme.layout_tile       = theme.confdir .. "/icons.zenburn/layouts/tile.png"
theme.layout_tileleft   = theme.confdir .. "/icons.zenburn/layouts/tileleft.png"
theme.layout_tilebottom = theme.confdir .. "/icons.zenburn/layouts/tilebottom.png"
theme.layout_tiletop    = theme.confdir .. "/icons.zenburn/layouts/tiletop.png"
theme.layout_fairv      = theme.confdir .. "/icons.zenburn/layouts/fairv.png"
theme.layout_fairh      = theme.confdir .. "/icons.zenburn/layouts/fairh.png"
theme.layout_spiral     = theme.confdir .. "/icons.zenburn/layouts/spiral.png"
theme.layout_dwindle    = theme.confdir .. "/icons.zenburn/layouts/dwindle.png"
theme.layout_max        = theme.confdir .. "/icons.zenburn/layouts/max.png"
theme.layout_fullscreen = theme.confdir .. "/icons.zenburn/layouts/fullscreen.png"
theme.layout_magnifier  = theme.confdir .. "/icons.zenburn/layouts/magnifier.png"
theme.layout_floating   = theme.confdir .. "/icons.zenburn/layouts/floating.png"


--[[
theme.layout_tile       = theme.confdir .. "/icons.blindalien/layouts/tile.png"
theme.layout_tileleft   = theme.confdir .. "/icons.blindalien/layouts/tileleft.png"
theme.layout_tilebottom = theme.confdir .. "/icons.blindalien/layouts/tilebottom.png"
theme.layout_tiletop    = theme.confdir .. "/icons.blindalien/layouts/tiletop.png"
theme.layout_fairv      = theme.confdir .. "/icons.blindalien/layouts/fairv.png"
theme.layout_fairh      = theme.confdir .. "/icons.blindalien/layouts/fairh.png"
theme.layout_spiral     = theme.confdir .. "/icons.blindalien/layouts/spiral.png"
theme.layout_dwindle    = theme.confdir .. "/icons.blindalien/layouts/dwindle.png"
theme.layout_max        = theme.confdir .. "/icons.blindalien/layouts/max.png"
theme.layout_fullscreen = theme.confdir .. "/icons.blindalien/layouts/fullscreen.png"
theme.layout_magnifier  = theme.confdir .. "/icons.blindalien/layouts/magnifier.png"
theme.layout_floating   = theme.confdir .. "/icons.blindalien/layouts/floating.png"
--]]
-- }}}

-- {{{ Titlebar
--[[
theme.titlebar_close_button_focus  = "/usr/share/awesome/themes.blindalien/titlebar/close_focus.png"
theme.titlebar_close_button_normal = "/usr/share/awesome/themes.blindalien/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = "/usr/share/awesome/themes.blindalien/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes.blindalien/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = "/usr/share/awesome/themes.blindalien/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes.blindalien/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = "/usr/share/awesome/themes.blindalien/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes.blindalien/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = "/usr/share/awesome/themes.blindalien/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes.blindalien/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = "/usr/share/awesome/themes.blindalien/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes.blindalien/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = "/usr/share/awesome/themes.blindalien/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes.blindalien/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = "/usr/share/awesome/themes.blindalien/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes.blindalien/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = "/usr/share/awesome/themes.blindalien/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes.blindalien/titlebar/maximized_normal_inactive.png"
--]]
-- }}}
-- }}}

return theme
