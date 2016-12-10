#module.exports = (robot) ->
#  robot.respond /にゃーん/i, (msg) ->
#    msg.send 'にゃーん'
#
#module.exports = (robot) ->
#  robot.hear /にゃーん/i, (msg) ->
#    msg.send "@rrbot にゃーん"

module.exports = (robot) ->
  robot.hear /にゃーん/, (msg) ->
    msg.send msg.random ["@rrbot にゃー", "@rrbot にゃ", "@rrbot にゃー、にゃー", "にゃん :nyancat:"]

