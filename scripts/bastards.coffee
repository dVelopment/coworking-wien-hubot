# Description:
#   Respond accordingly to bastards
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   bastards! - displays a "You bastards!" gif

module.exports = (robot) ->
  robot.hear /bastards!/i, (msg) ->
    bastards msg, robot


bastards = (msg, robot) ->
    msg.send "http://www.reactiongifs.com/wp-content/uploads/2013/06/bastards.gif"