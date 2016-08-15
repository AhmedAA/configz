command: "ESC=`printf \"\e\"`; ps -A -o %cpu | awk '{s+=$1} END {printf(\"%.2f\",s/8);}'"

refreshFrequency: 2000 # ms

render: (output) ->
  "cpu <span>#{output}</span> ❚"

style: """
  -webkit-font-smoothing: antialiased
  color: #FFFFFF
  font: 11px Osaka-Mono
  left: 50.5%
  top: 9px
  span
    color: #FFFFFF
"""
