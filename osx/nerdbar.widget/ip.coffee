command: "ipconfig getifaddr en0"

refreshFrequency: 10000 # ms

render: (output) ->
  "wifi #{output} ❚"

style: """
  -webkit-font-smoothing: antialiased
  color: #FFFFFF
  font: 11px Osaka-Mono
  left: 37.5%
  top: 9px
"""
