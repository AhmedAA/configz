command: """
IFS='|' read -r info <<<"$(osascript <<<'set info to ""
  tell application "System Events"
    set num to count (every process whose name is "Tunnelblick")
  end tell
  if num > 0 then
    tell application "Tunnelblick"
        set info to get state of first configuration where name = "Denmark"
    end tell
  end if
  return info')"
echo "$info"
"""

render: (output) ->
  "VPN #{output}"

refreshFrequency: 50000 # ms

style: """
  -webkit-font-smoothing: antialiased
  font: 10px Osaka-Mono
  top: 9px
  left: 44.4%
  color: #FFFFFF
"""
