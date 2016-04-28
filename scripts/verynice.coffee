# Description:
#   Display Borat "Very Nice"
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   very nice - display a Borat "Very Nice" image

module.exports = (robot) ->
  robot.hear /very nice/i, (msg) ->
    msg.send "http://i.imgur.com/lqKlotB.png"
