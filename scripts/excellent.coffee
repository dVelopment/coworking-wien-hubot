# Description:
#   Display a Mr. Burns - "Excellent!" GIF everytime somebody writes "excellent!"
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   excellent - display a Mr. Burns - "Excellent!" GIF

module.exports = (robot) ->
  robot.hear /excellent/i, (msg) ->
    msg.send "http://www.reactiongifs.com/r/exc.gif"
