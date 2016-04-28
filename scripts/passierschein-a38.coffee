# Description:
#   Link the (German) clip from Asterix every time the Passierschein A38 is mentioned
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   passierschein a38 - Link the German clip from Asterix

module.exports = (robot) ->
  robot.hear /passierschein a38/i, (msg) ->
    msg.send "https://www.youtube.com/watch?v=lIiUR2gV0xk"
