# Description:
#   Get Hubot to chime in to the battle-cry of the Ultramarines
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   we march for macragge - And we shall know no fear!

module.exports = (robot) ->
  robot.hear /we march for macragge/i, (msg) ->
    msg.send "And we shall know no fear!"
