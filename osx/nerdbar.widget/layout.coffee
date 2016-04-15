command: "echo $(/usr/local/bin/kwmc query focused)"

refreshFrequency: 1000 # ms

render: (output) ->
  "#{output}"

style: """
  -webkit-font-smoothing: antialiased
  color: #FFFFFF
  font: 11px Osaka-Mono
  height: 16px
  left: 6px
  overflow: hidden
  text-overflow: ellipsis
  top: 9px
  width: 500px
"""
