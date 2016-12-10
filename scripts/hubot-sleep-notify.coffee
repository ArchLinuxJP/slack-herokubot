#module.exports = (robot) ->
#
#  cid = setInterval ->
#    return if typeof robot?.send isnt 'function'
#    robot.send {room: "#rss"}, "wake up!"
#    clearInterval cid
#  , 1000
#
#  on_sigterm = ->
#    robot.send {room: "#rss"}, 'sleep...Zzz'
#    setTimeout process.exit, 1000
#
#  if process._events.SIGTERM?
#    process._events.SIGTERM = on_sigterm
#  else
#    process.on 'SIGTERM', on_sigterm
