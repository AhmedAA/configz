command: "date +\"%H:%M\""

refreshFrequency: 10000 # ms

render: (output) ->
  "<i>◴</i> #{output}"

style: """
  -webkit-font-smoothing: antialiased
  color: #FFFFFF
  font: 11px Osaka-Mono
  left: 63%
  top: 7px
"""
