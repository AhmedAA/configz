command: """
IFS='|' read -r info <<<"$(osascript <<<'set info to ""
  tell application "System Events"
    set num to count (every process whose name is "Spotify")
  end tell
  if num > 0 then
    tell application "Spotify"
      if player state is playing then
        set who to artist of current track
        set what to name of current track
        set info to "“" & what & "”" & " by " & who
      end if
      if player state is paused then
        set info to " paused"
      end if
    end tell
  end if
  return info')"
echo "$info"
"""

render: (output) ->
  "❚ <i>♫ </i>#{output} ❚"

refreshFrequency: 5000 # ms

style: """
  -webkit-font-smoothing: antialiased
  font: 10px Osaka-Mono
  top: 4px
  left: 45%
  color: #FABD2F
  span
    color: #9C9486
"""
