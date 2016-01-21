command: """
IFS='|' read -r theArtist theName <<<"$(osascript <<<'tell application "Spotify"
        set theTrack to current track
        set theArtist to artist of theTrack
        set theName to name of theTrack
        return theArtist & "|" & theName
    end tell')"
echo "$theArtist - $theName"
"""

render: (output) ->
  "<i>♫ </i>#{output}"

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
