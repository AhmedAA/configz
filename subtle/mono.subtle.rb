# -*- encoding: utf-8 -*-
#
# Author::  Christoph Kappel <unexist@subforge.org>
# Version:: $Id$
# License:: GNU GPLv2
#
# = Subtle default configuration
#
# This file will be installed as default and can also be used as a starter for
# an own custom configuration file. The system wide config usually resides in
# +/etc/xdg/subtle+ and the user config in +HOME/.config/subtle+, both locations
# are dependent on the locations specified by +XDG_CONFIG_DIRS+ and
# +XDG_CONFIG_HOME+.
#
require "subtle/subtlext"
#
# == Options
#
# Following options change behaviour and sizes of the window manager:
#

# Window move/resize steps in pixel per keypress
set :increase_step, 5

# Window screen border snapping
set :border_snap, 10

# Default starting gravity for windows. Comment out to use gravity of
# currently active client
set :default_gravity, :center

# Make dialog windows urgent and draw focus
set :urgent_dialogs, false

# Honor resize size hints globally
set :honor_size_hints, false

# Enable gravity tiling for all gravities
set :gravity_tiling, false

# Enable click-to-focus focus model
set :click_to_focus, false

# Skip pointer movement on e.g. gravity change
set :skip_pointer_warp, false

# Skip pointer movement to urgent windows
set :skip_urgent_warp, false

# Set the WM_NAME of subtle (Java quirk)
# set :wmname, "LG3D"

#
# == Screen
#
# Generally subtle comes with two panels per screen, one on the top and one at
# the bottom. Each panel can be configured with different panel items and
# sublets screen wise. The default config uses top panel on the first screen
# only, it's up to the user to enable the bottom panel or disable either one
# or both.

# === Properties
#
# [*stipple*]    This property adds a stipple pattern to both screen panels.
#
#                Example: stipple "~/stipple.xbm"
#                         stipple Subtlext::Icon.new("~/stipple.xbm")
#
# [*top*]        This property adds a top panel to the screen.
#
#                Example: top [ :views, :title ]
#
# [*bottom*]     This property adds a bottom panel to the screen.
#
#                Example: bottom [ :views, :title ]

#
# Following items are available for the panels:
#
# [*:views*]     List of views with buttons
# [*:title*]     Title of the current active window
# [*:tray*]      Systray icons (Can be used only once)
# [*:keychain*]  Display current chain (Can be used only once)
# [*:sublets*]   Catch-all for installed sublets
# [*:sublet*]    Name of a sublet for direct placement
# [*:spacer*]    Variable spacer (free width / count of spacers)
# [*:center*]    Enclose items with :center to center them on the panel
# [*:separator*] Insert separator
#
# Empty panels are hidden.
#
# === Links
#
# http://subforge.org/projects/subtle/wiki/Multihead
# http://subforge.org/projects/subtle/wiki/Panel
#

screen 1 do
  top    [ :mpd, :center, :views, :center, :spacer, :tray, :separator, :wifi, :separator, :battery, :separator, :volume, :separator, :clock ]
  bottom [ :layout, :center, :title, :center, :spacer, :nettraffic, :separator, :memory ]
end

# Example for a second screen:
#screen 2 do
#  top    [ :views, :title, :spacer ]
#  bottom [ ]
#end

#
# == Styles
#
# Styles define various properties of styleable items in a CSS-like syntax.
#
# If no background color is given no color will be set. This will ensure a
# custom background pixmap won't be overwritten.
#
# Following properties are available for most the styles:
#
# [*foreground*] Foreground text color
# [*background*] Background color
# [*margin*]     Outer spacing
# [*border*]     Border color and size
# [*padding*]    Inner spacing
# [*font*]       Font string (xftontsel or xft)
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Styles
# Style for all style elements
style :all do
  background    "#111111"
  icon          "#111111"
  padding       3, 3, 3, 3
  font          "xft:termsynu:pixelsize=9"
end

# Style for the all views
style :views do
  padding	3, 8, 0, 8
  foreground    "#3f3f3f"
  icon          "#3f3f3f"

  # Style for the active views
  style :focus do
   # foreground  "#ffffff"
   # foreground  "#00FF00"
   # background	"#1f1f1f"
    icon        "#ffffff"
   # icon        "#00C400"
   # border_top  "#00C400", 2
  end

  # Style for urgent widow titles and views
  style :urgent do
    foreground  "#ff0000"
    icon "#ff0000"
  end

  # Style for occupied views (views with clients)
  style :occupied do
    foreground  "#909090"
    icon        "#909090"
    # border_top  "#909090", 1
  end
end

# Style for sublets
style :sublets do
  foreground    "#757575"
  background    "#111111"
  icon		"#757575"
end

# Style for separator
style :separator do
  foreground  "#757575"
  separator   "|"
end

# Style for focus window title
style :title do
  foreground  "#ffffff"
end

# Style for active/inactive windows
style :clients do
  active    "#222222", 0
  inactive  "#494949", 0
  margin    5
  width     50
end

# Style for subtle
style :subtle do
  margin      2, 2, 2, 2
  panel       "#111111"
  background  "#111111"
  stipple     "#757575"
end

#
# == Gravities
#
# Gravities are predefined sizes a window can be set to. There are several ways
# to set a certain gravity, most convenient is to define a gravity via a tag or
# change them during runtime via grab. Subtler and subtlext can also modify
# gravities.
#
# A gravity consists of four values which are a percentage value of the screen
# size. The first two values are x and y starting at the center of the screen
# and he last two values are the width and height.
#
# === Example
#
# Following defines a gravity for a window with 100% width and height:
#
#   gravity :example, [ 0, 0, 100, 100 ]
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Gravity
#

# Top left
gravity :top_left,       [   0,   0,  50,  50 ]
gravity :top_left66,     [   0,   0,  50,  66 ]
gravity :top_left33,     [   0,   0,  50,  34 ]

# Top
gravity :top,            [   0,   0, 100,  50 ]
gravity :top66,          [   0,   0, 100,  66 ]
gravity :top33,          [   0,   0, 100,  34 ]

# Top right
gravity :top_right,      [  50,   0,  50,  50 ]
gravity :top_right66,    [  50,   0,  50,  66 ]
gravity :top_right33,    [  50,   0,  50,  33 ]

# Left
gravity :left,           [   0,   0,  50, 100 ]
gravity :left66,         [   0,   0,  66, 100 ]
gravity :left33,         [   0,   0,  33, 100 ]

# Center
gravity :center,         [   0,   0, 100, 100 ]
gravity :center66,       [  17,  17,  66,  66 ]
gravity :center33,       [  33,  33,  33,  33 ]

# Right
gravity :right,          [  50,   0,  50, 100 ]
gravity :right66,        [  34,   0,  66, 100 ]
gravity :right33,        [  67,   0,  33, 100 ]

# Bottom left
gravity :bottom_left,    [   0,  50,  50,  50 ]
gravity :bottom_left66,  [   0,  34,  50,  66 ]
gravity :bottom_left33,  [   0,  67,  50,  33 ]

# Bottom
gravity :bottom,         [   0,  50, 100,  50 ]
gravity :bottom66,       [   0,  34, 100,  66 ]
gravity :bottom33,       [   0,  67, 100,  33 ]

# Bottom right
gravity :bottom_right,   [  50,  50,  50,  50 ]
gravity :bottom_right66, [  50,  34,  50,  66 ]
gravity :bottom_right33, [  50,  67,  50,  33 ]

# Gimp
gravity :gimp_image,     [  10,   0,  80, 100 ]
gravity :gimp_toolbox,   [   0,   0,  15, 100 ]
gravity :gimp_dock,      [  90,   0,  10, 100 ]

# Compose
gravity :compose,        [  17,   17, 66, 100 ]

#
# == Grabs
#
# Grabs are keyboard and mouse actions within subtle, every grab can be
# assigned either to a key and/or to a mouse button combination. A grab
# consists of a chain and an action.
#
# === Finding keys
#
# The best resource for getting the correct key names is
# */usr/include/X11/keysymdef.h*, but to make life easier here are some hints
# about it:
#
# * Numbers and letters keep their names, so *a* is *a* and *0* is *0*
# * Keypad keys need *KP_* as prefix, so *KP_1* is *1* on the keypad
# * Strip the *XK_* from the key names if looked up in
#   /usr/include/X11/keysymdef.h
# * Keys usually have meaningful english names
# * Modifier keys have special meaning (Alt (A), Control (C), Meta (M),
#   Shift (S), Super (W))
#
# === Chaining
#
# Chains are a combination of keys and modifiers to one or a list of keys
# and can be used in various ways to trigger an action. In subtle, there are
# two ways to define chains for grabs:
#
#   1. *Default*: Add modifiers to a key and use it for a grab
#
#      *Example*: grab "W-Return", "urxvt"
#
#   2. *Chain*: Define a list of grabs that need to be pressed in order
#
#      *Example*: grab "C-y Return", "urxvt"
#
# ==== Mouse buttons
#
# [*B1*]  = Button1 (Left mouse button)
# [*B2*]  = Button2 (Middle mouse button)
# [*B3*]  = Button3 (Right mouse button)
# [*B4*]  = Button4 (Mouse wheel up)
# [*B5*]  = Button5 (Mouse wheel down)
# [*...*]
# [*B20*] = Button20 (Are you sure that this is a mouse and not a keyboard?)
#
# ==== Modifiers
#
# [*A*] = Alt key (Mod1)
# [*C*] = Control key
# [*M*] = Meta key (Mod3)
# [*S*] = Shift key
# [*W*] = Super/Windows key (Mod4)
# [*G*] = Alt Gr (Mod5)
#
# === Action
#
# An action is something that happens when a grab is activated, this can be one
# of the following:
#
# [*symbol*] Run a subtle action
# [*string*] Start a certain program
# [*array*]  Cycle through gravities
# [*lambda*] Run a Ruby proc
#
# === Example
#
# This will create a grab that starts a urxvt when Alt+Enter are pressed:
#
#   grab "A-Return", "urxvt"
#   grab "C-a c",    "urxvt"
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Grabs
#

# Jump to view1, view2, ...
grab "W-S-1", :ViewJump1
grab "W-S-2", :ViewJump2
grab "W-S-3", :ViewJump3
grab "W-S-4", :ViewJump4
grab "W-S-5", :ViewJump5
grab "W-S-6", :ViewJump6
grab "W-S-7", :ViewJump7

# Switch current view
grab "W-1", :ViewSwitch1
grab "W-2", :ViewSwitch2
grab "W-3", :ViewSwitch3
grab "W-4", :ViewSwitch4
grab "W-5", :ViewSwitch5
grab "W-6", :ViewSwitch6
grab "W-7", :ViewSwitch7

# Select next and prev view */
grab "KP_Add",      :ViewNext
grab "KP_Subtract", :ViewPrev

# Move mouse to screen1, screen2, ...
grab "W-A-1", :ScreenJump1
grab "W-A-2", :ScreenJump2
grab "W-A-3", :ScreenJump3
grab "W-A-4", :ScreenJump4
grab "W-A-5", :ScreenJump5
grab "W-A-6", :ScreenJump6
grab "W-A-7", :ScreenJump7

# alt tab
grab "A-Tab" do
  clients = Subtlext::Client.visible

  clients.last.instance_eval do
    focus
    raise
  end
end

grab "A-S-Tab" do 
  clients = Subtlext::Client.visible

  clients.first.instance_eval do                                                 
    lower                                                                        
  end
  clients.first.instance_eval do
    focus
  end                                                                            
end

# switch view with arrows
grab "C-A-Right" do
  vArr = Subtlext::View[:all];
  cindx = vArr.index(Subtlext::View.current);

  for i in 1..vArr.size do
    cV = vArr[(i + cindx) % vArr.size];
    if (!cV.clients.empty? && Subtlext::View.visible.index(cV) == nil) then
      cV.jump;
      break;
    end
  end
end

grab "C-A-Left" do
  vArr = Subtlext::View[:all].reverse;
  cindx = vArr.index(Subtlext::View.current);

  for i in 1..vArr.size do
    cV = vArr[(i + cindx) % vArr.size];
    if (!cV.clients.empty? && Subtlext::View.visible.index(cV) == nil) then
      cV.jump;
      break;
    end
  end
end

# Force reload of config and sublets
grab "W-C-r", :SubtleReload

# Force restart of subtle
grab "W-C-S-r", :SubtleRestart

# Quit subtle
grab "W-C-q", :SubtleQuit

# volume
# Direct control
#grab "XF86AudioRaiseVolume", "amixer -c 0 set Master 2dB+"
#grab "XF86AudioLowerVolume", "amixer -c 0 set Master 2dB-"
#grab "XF86AudioMute", "amixer -c 0 set Master toggle"
# Control through volume sublet
grab "XF86AudioRaiseVolume", :VolumeRaise
grab "XF86AudioLowerVolume", :VolumeLower
grab "XF86AudioMute", :VolumeToggle

# moc
#grab "XF86AudioPrev", "mocp --previous"
#grab "XF86AudioPlay", "mocp -G"
#grab "XF86AudioNext", "mocp --next"

# ncmpcpp
grab "XF86AudioPrev", "ncmpcpp prev"
grab "XF86AudioPlay", "ncmpcpp toggle"
grab "XF86AudioNext", "ncmpcpp next"

# screenshot
grab "Print", "import -window root /tmp/$(date +%F_%H%M%S_%N).png"
grab "A-Print", "import -frame /tmp/$(date +%F_%H%M%S_%N).png"

# power
#reboot
grab "W-C-A-r", "sudo /sbin/shutdown -r now"
#poweroff
grab "W-C-A-p", "sudo /sbin/shutdown -h now"

# Move current window
grab "W-B1", :WindowMove

# Resize current window
grab "W-B3", :WindowResize

# Toggle floating mode of window
grab "W-f", :WindowFull

# Toggle fullscreen mode of window
grab "W-space", :WindowFloat

# Toggle sticky mode of window (will be visible on all views)
grab "W-S-s", :WindowStick

# Toggle zaphod mode of window (will span across all screens)
grab "W-equal", :WindowZaphod

# Raise window
grab "W-r", :WindowRaise

# Lower window
grab "W-l", :WindowLower

# Select next windows
grab "W-Left",  :WindowLeft
grab "W-Down",  :WindowDown
grab "W-Up",    :WindowUp
grab "W-Right", :WindowRight

# Kill current window
grab "W-S-k", :WindowKill

# Cycle between given gravities
grab "W-q", [ :top_left,     :top_left66,     :top_left33     ]
grab "W-w", [ :top,          :top66,          :top33          ]
grab "W-e", [ :top_right,    :top_right66,    :top_right33    ]

grab "W-a", [ :left,         :left66,         :left33         ]
grab "W-s", [ :center,       :center66,       :center33       ]
grab "W-d", [ :right,        :right66,        :right33        ]

grab "W-z", [ :bottom_left,  :bottom_left66,  :bottom_left33  ]
grab "W-x", [ :bottom,       :bottom66,       :bottom33       ]
grab "W-c", [ :bottom_right, :bottom_right66, :bottom_right33 ]

# Exec programs
grab "W-Return", "urxvt"
grab "W-S-e" , "urxvt -name emacs -e emacs -nw"
grab "W-S-Return", "urxvt -name devterm"
grab "W-S-f", "urxvt -e mc -b"
grab "W-A-m" , "urxvt -name ncmpcpp -e ncmpcpp"
grab "W-A-S-m", "urxvt -name mplayer"
#grab "W-p", "dmenu_run -sb darkgreen"
grab "C-Escape", "i3lock -i /home/ahmed/Pictures/wp/108.png -d && ncmpcpp pause"
#grab "C-Escape", "i3lock -c 000000"

# selector #####################################################################
begin
  require "#{ENV["HOME"]}/.config/subtle/selector.rb" 

  # Set font
  Subtle::Contrib::Selector.font = "xft:termsynu:pixelsize=18:antialias=true" 
rescue LoadError => error
  puts error
end

grab "W-S-x" do
  Subtle::Contrib::Selector.run
end
################################################################################

# launcher #####################################################################
begin
  require "#{ENV["HOME"]}/.config/subtle/launcher.rb"
# Set paths
  Subtle::Contrib::Launcher.paths = [ "/usr/bin", "/home/ahmed/.config/subtle" ]
# Set fonts
  Subtle::Contrib::Launcher.fonts = [
                                     "xft:termsynu:pixelsize=18:antialias=true",
                                     "xft:termsynu:pixelsize=18:antialias=true" 
                                    ]
rescue LoadError => error
  puts error
end

grab "W-p" do
  Subtle::Contrib::Launcher.run
end
################################################################################

# layouts
grab "A-S-j", :LayoutSetRight
grab "A-j", :LayoutNext
grab "A-k", :LayoutPrev
grab "A-g", :LayoutSetGravity
grab "A-space", :LayoutSetNone

# Run Ruby lambdas
grab "S-F2" do |c|
  puts c.name
end

grab "S-F3" do
  puts Subtlext::VERSION
end

#
# == Tags
#
# Tags are generally used in subtle for placement of windows. This placement is
# strict, that means that - aside from other tiling window managers - windows
# must have a matching tag to be on a certain view. This also includes that
# windows that are started on a certain view will not automatically be placed
# there.
#
# There are to ways to define a tag:
#
# === Simple
#
# The simple way just needs a name and a regular expression to just handle the
# placement:
#
# Example:
#
#  tag "terms", "terms"
#
# === Extended
#
# Additionally tags can do a lot more then just control the placement - they
# also have properties than can define and control some aspects of a window
# like the default gravity or the default screen per view.
#
# Example:
#
#  tag "terms" do
#    match   "xterm|[u]?rxvt"
#    gravity :center
#  end
#
# === Default
#
# Whenever a window has no tag it will get the default tag and be placed on the
# default view. The default view can either be set by the user with adding the
# default tag to a view by choice or otherwise the first defined view will be
# chosen automatically.
#
# === Properties
#
# [*borderless*] This property enables the borderless mode for tagged clients.
#
#                Example: borderless true
#                Links:    http://subforge.org/projects/subtle/wiki/Tagging#Borderless
#                          http://subforge.org/projects/subtle/wiki/Clients#Borderless
#
# [*fixed*]      This property enables the fixed mode for tagged clients.
#
#                Example: fixed true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Fixed
#                         http://subforge.org/projects/subtle/wiki/Clients#Fixed
#
# [*float*]      This property enables the float mode for tagged clients.
#
#                Example: float true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Float
#                         http://subforge.org/projects/subtle/wiki/Clients#Float
#
# [*full*]       This property enables the fullscreen mode for tagged clients.
#
#                Example: full true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Fullscreen
#                         http://subforge.org/projects/subtle/wiki/Clients#Fullscreen
#
# [*geometry*]   This property sets a certain geometry as well as floating mode
#                to the tagged client, but only on views that have this tag too.
#                It expects an array with x, y, width and height values whereas
#                width and height must be >0.
#
#                Example: geometry [100, 100, 50, 50]
#                Link:    http://subforge.org/projects/subtle/wiki/Tagging#Geometry
#
# [*gravity*]    This property sets a certain to gravity to the tagged client,
#                but only on views that have this tag too.
#
#                Example: gravity :center
#                Link:    http://subforge.org/projects/subtle/wiki/Tagging#Gravity
#
# [*match*]      This property adds matching patterns to a tag, a tag can have
#                more than one. Matching works either via plaintext, regex
#                (see man regex(7)) or window id. Per default tags will only
#                match the WM_NAME and the WM_CLASS portion of a client, this
#                can be changed with following possible values:
#
#                [*:name*]      Match the WM_NAME
#                [*:instance*]  Match the first (instance) part from WM_CLASS
#                [*:class*]     Match the second (class) part from WM_CLASS
#                [*:role*]      Match the window role
#                [*:type*]      Match the window type
#
#                Examples: match instance: "urxvt"
#                          match [:role, :class] => "test"
#                          match "[xa]+term"
#                Link:     http://subforge.org/projects/subtle/wiki/Tagging#Match
#
# [*position*]   Similar to the geometry property, this property just sets the
#                x/y coordinates of the tagged client, but only on views that
#                have this tag, too. It expects an array with x and y values.
#
#                Example: position [ 10, 10 ]
#                Link:    http://subforge.org/projects/subtle/wiki/Tagging#Position
#
# [*resize*]     This property enables the float mode for tagged clients. When set,
#                subtle honors size hints, that define various size constraints like
#                sizes for columns and rows of a terminal.
#
#                Example: resize true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Resize
#                         http://subforge.org/projects/subtle/wiki/Clients#Resize
#
# [*stick*]      This property enables the stick mode for tagged clients. When set,
#                clients are visible on all views, even when they don't have matching
#                tags. On multihead, sticky clients keep the screen they are assigned
#                on.
#
#                Supported values are either true or a number to specify a screen.
#
#                Example: stick true
#                         stick 1
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Stick
#                         http://subforge.org/projects/subtle/wiki/Clients#Stick
#
# [*type*]       This property sets the tagged client to be treated as a specific
#                window type though as the window sets the type itself. Following
#                types are possible:
#
#                [*:desktop*]  Treat as desktop window (_NET_WM_WINDOW_TYPE_DESKTOP)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Desktop
#                [*:dock*]     Treat as dock window (_NET_WM_WINDOW_TYPE_DOCK)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Dock
#                [*:toolbar*]  Treat as toolbar windows (_NET_WM_WINDOW_TYPE_TOOLBAR)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Toolbar
#                [*:splash*]   Treat as splash window (_NET_WM_WINDOW_TYPE_SPLASH)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Splash
#                [*:dialog*]   Treat as dialog window (_NET_WM_WINDOW_TYPE_DIALOG)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Dialog
#
#                Example: type :desktop
#                Link:    http://subforge.org/projects/subtle/wiki/Tagging#Type
#
# [*urgent*]     This property enables the urgent mode for tagged clients. When set,
#                subtle automatically sets this client to urgent.
#
#                Example: urgent true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Stick
#                         http://subforge.org/projects/subtle/wiki/Clients#Urgent
#
# [*zaphod*]     This property enables the zaphod mode for tagged clients. When set,
#                the client spans across all connected screens.
#
#                Example: zaphod true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Zaphod
#                         http://subforge.org/projects/subtle/wiki/Clients#Zaphod
#
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Tagging
#

# Simple tags
tag "terms" do
  match :instance => "xterm|[u]?rxvt|terminology"
end

tag "dev" do
  match :name => "devterm"
end

tag "study" do
  match "zathura"
  match "calibre"
  match :name => "NixNote"
end

tag "mail/chat" do
  match "thunderbird"
  match "pinentry"
end

tag "compose" do
  match :instance => "Msgcompose"
  gravity :compose
end

tag "media" do
  match "gpicview"
  match "mypaint"
  match "inkscape"
  match :name => "ncmpcpp"
  match :name => "mplayer"
end

tag "games" do
  match "Steam|hl_linux|hl2_linux"
  match :name => "Bastion"
  float true
end

tag "browser" do
  match "uzbl|opera|firefox|navigator"
  match :name => "Security Approval Required"
  match :instance => "sun-awt-X11-XDialogPeer"
end

tag "flash" do
  match "<unknown>|plugin-container|exe|operapluginwrapper|npviewer.bin" 
#  stick true
end

# Placement
tag "editor" do
  match  "[g]?vim|emacs"
end

tag "fixed" do
  geometry [ 10, 10, 100, 100 ]
  stick    true
end

tag "gravity" do
  gravity :center
end

# Modes
tag "center66" do
  match "mplayer"
  gravity :center66
end

tag "stick" do
#  match "mplayer"
  float true
  stick true
end

tag "float" do
  match "display"
  float true
end

# Gimp
tag "gimp_image" do
  match   :role => "gimp-image-window"
  gravity :gimp_image
end

tag "gimp_resynth" do
  match :name => "Resynthesize"
end

tag "gimp_toolbox" do
  match   :role => "gimp-toolbox$"
  gravity :gimp_toolbox
end

tag "gimp_dock" do
  match   :role => "gimp-dock"
  gravity :gimp_dock
end

tag "gimp_scum" do
  match role: "gimp-.*|screenshot"
end

#
# == Views
#
# Views are the virtual desktops in subtle, they show all windows that share a
# tag with them. Windows that have no tag will be visible on the default view
# which is the view with the default tag or the first defined view when this
# tag isn't set.
#
# Like tags views can be defined in two ways:
#
# === Simple
#
# The simple way is exactly the same as for tags:
#
# Example:
#
#   view "terms", "terms"
#
# === Extended
#
# The extended way for views is also similar to the tags, but with fewer
# properties.
#
# Example:
#
#  view "terms" do
#    match "terms"
#    icon  "/usr/share/icons/icon.xbm"
#  end
#
# === Properties
#
# [*match*]      This property adds a matching pattern to a view. Matching
#                works either via plaintext or regex (see man regex(7)) and
#                applies to names of tags.
#
#                Example: match "terms"
#
# [*dynamic*]    This property hides unoccupied views, views that display no
#                windows.
#
#                Example: dynamic true
#
# [*icon*]       This property adds an icon in front of the view name. The
#                icon can either be path to an icon or an instance of
#                Subtlext::Icon.
#
#                Example: icon "/usr/share/icons/icon.xbm"
#                         icon Subtlext::Icon.new("/usr/share/icons/icon.xbm")
#
# [*icon_only*]  This property hides the view name from the view buttons, just
#                the icon will be visible.
#
#                Example: icon_only true
#
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Tagging
#

view "home" do
  match "terms|default"
  icon  "/home/ahmed/.icons/house.xbm"
  icon_only true
end

view "www" do
  match "browser|flash"
  icon "/home/ahmed/.icons/world.xbm"
  icon_only true
end

view "dev" do
  match "editor|dev"
  icon "/home/ahmed/.icons/puzzle.xbm"
  icon_only true
end

view "study" do
  match "study"
  icon "/home/ahmed/.icons/notepad.xbm"
  icon_only true
end

view "media" do
  match "gimp_.*|media|center66"
  icon "/home/ahmed/.icons/headphones.xbm"
  icon_only true
end

view "games" do
  match "games"
  dynamic true
  icon "/home/ahmed/.icons/fox.xbm"
  icon_only true
end

view "mail" do
  match "mail|compose"
  icon "/home/ahmed/.icons/mail.xbm"
  icon_only true
end

#
# == Sublets
#
# Sublets are Ruby scripts that provide data for the panel and can be managed
# with the sur script that comes with subtle.
#
# === Example
#
#  sur install clock
#  sur uninstall clock
#  sur list
#
# === Configuration
#
# All sublets have a set of configuration values that can be changed directly
# from the config of subtle.
#
# There are three default properties, that can be be changed for every sublet:
#
# [*interval*]    Update interval of the sublet
# [*foreground*]  Default foreground color
# [*background*]  Default background color
#
# sur can also give a brief overview about properties:
#
# === Example
#
#   sur config clock
#
# The syntax of the sublet configuration is similar to other configuration
# options in subtle:
#
# === Example
#
#  sublet :clock do
#    interval      30
#    foreground    "#eeeeee"
#    background    "#000000"
#    format_string "%H:%M:%S"
#  end
#
#  === Link
#
# http://subforge.org/projects/subtle/wiki/Sublets
#
sublet :clock do
  interval      30
  foreground    "#eeeeee"
  background    "#000000"
  format_string "%H:%M %A %d %B"
end

sublet :battery do
  colors 15 => "#ff0000", 100 => "#00ff00"
end

sublet :volume do
  step 1
end

#
# == Hooks
#
# And finally hooks are a way to bind Ruby scripts to a certain event.
#
# Following hooks exist so far:
#
# [*:client_create*]    Called whenever a window is created
# [*:client_configure*] Called whenever a window is configured
# [*:client_focus*]     Called whenever a window gets focus
# [*:client_kill*]      Called whenever a window is killed
#
# [*:tag_create*]       Called whenever a tag is created
# [*:tag_kill*]         Called whenever a tag is killed
#
# [*:view_create*]      Called whenever a view is created
# [*:view_configure*]   Called whenever a view is configured
# [*:view_jump*]        Called whenever the view is switched
# [*:view_kill*]        Called whenever a view is killed
#
# [*:tile*]             Called on whenever tiling would be needed
# [*:reload*]           Called on reload
# [*:start*]            Called on start
# [*:exit*]             Called on exit
#
# === Example
#
# This hook will print the name of the window that gets the focus:
#
#   on :client_focus do |c|
#     puts c.name
#   end
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Hooks
#
