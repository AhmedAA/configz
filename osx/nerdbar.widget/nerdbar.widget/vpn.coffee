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
  "<i>✓ VPN: </i>#{output} ❚"

refreshFrequency: 50000 # ms

style: """
  -webkit-font-smoothing: antialiased
  font: 10px Osaka-Mono
  top: 7px
  right: 763px
  color: #FABD2F
  span
    color: #9C9486
"""
