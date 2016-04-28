# Description:
#   Display NBC's "The more you know" logo
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   the more you know - Display NBC's "The more you know" logo

module.exports = (robot) ->
  robot.hear /the more you know/i, (msg) ->
    msg.send "http://i.imgur.com/IW8simF.gif"
