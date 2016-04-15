command: "date +\"%a %d %b\""

refreshFrequency: 10000

render: (output) ->
  "#{output} ❚"

style: """
  -webkit-font-smoothing: antialiased
  color: #FFFFFF
  font: 11px Osaka-Mono
  left: 58.3%
  top: 10px
"""
