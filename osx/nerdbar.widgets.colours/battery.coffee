command: "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto | cut -f1 -d';'"

refreshFrequency: 150000 # ms

render: (output) ->
  "❚<i>⚡</i>#{output}"

style: """
  -webkit-font-smoothing: antialiased
  font: 10px Osaka-Mono
  top: 8px
  left: 66.5%
  color: #FFEB3B
  span
    color: #FFEB3B
"""
