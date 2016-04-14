command: "date +\"%H:%M\""

refreshFrequency: 10000 # ms

render: (output) ->
  "<i>◴</i> #{output}"

style: """
  -webkit-font-smoothing: antialiased
  color: #458588
  font: 11px Osaka-Mono
  right: 460px
  top: 7px
"""
