NOTES
=====

xmonad and awesome configs are NOT up-to-date. So you are on your own!
(I might be able to help).

i3
==

i3 is semi-up-to-date. I stopped using i3 in May 2013.
Only thing to notice is that imagemagick must be installed for the
screenshot hotkeys to work.

subtle
======

Subtle is currently my window manager of choice!
Same as i3, imagemagick must be installed for the screenshot hotkeys
to work.

General notes:
alsa-oss must be installed for the volume sublet to work.
and "modprobe snd_mixer_oss"

sublets
=======

wifi
moc_info (is broken, need to fix)
volume

nettraffic (has been patched with icons)
added the following lines at the bottom:
  s.down = Subtlext::Icon.new("net_down_02.xbm")
  s.up   = Subtlext::Icon.new("net_up_02.xbm")
  s.data = "#{s.down}#{rx_speed} KB/s #{s.up}#{tx_speed} KB/s"

memory
layout
battery
clock
