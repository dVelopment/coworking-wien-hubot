# Description:
#   Confess your love for Hubot
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot i love you - Confess your love for Hubot

module.exports = (robot) ->
  robot.respond /i love you/i, (msg) ->
    if Math.random() < 0.5
      msg.send "I love you too"
    else
      msg.send "Piss off"
