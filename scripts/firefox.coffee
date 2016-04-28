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
  robot.hear /(firefox|\bff\b)/i, (msg) ->
    msg.send "http://cdn.meme.am/instances/500x/61452670.jpg"
