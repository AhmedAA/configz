command: "ESC=`printf \"\e\"`; ps -A -o %mem | awk '{s+=$1} END {print \"\" s}'"

refreshFrequency: 30000 # ms

render: (output) ->
  "mem <span>#{output}</span>"

style: """
  -webkit-font-smoothing: antialiased
  color: #FFFFFF
  font: 11px Osaka-Mono
  left: 54.5%
  top: 9px
  span
    color: #FFFFFF
"""
