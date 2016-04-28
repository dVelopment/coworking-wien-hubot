# Description:
#   Post a fry wondering image if you're wondering about something
#
# Configuration:
#   none
#
# Commands:
#   wondering - post image

module.exports = (robot) ->
    robot.hear /wondering\b/i, (msg) ->
        msg.send 'http://i0.kym-cdn.com/photos/images/newsfeed/000/131/399/fry.PNG?1307468855'
    
    robot.respond /you are a little slow/, (msg) ->
        seconds = Math.floor(Math.random() * 40000 + 5000)
        setTimeout () ->
          msg.reply "Who you calling 'slow'?"
        , seconds
