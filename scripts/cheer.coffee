# Description:
#   Feeling depressed?
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot cheer me up - A little pick me up
#
# Author:
#   carllerche

module.exports = (robot) ->
  robot.respond /cheer me up/i, (msg) ->
    aww msg, robot

  robot.hear /i( am|'m) emo/i, (msg) ->
    msg.send "Let me cheer you up."
    aww msg, robot

aww = (msg, robot) ->
  robot.http('http://www.reddit.com/r/aww.json')
    .header('Accept', 'application/json')
    .get() (err, res, body) ->
      try
        frontpage = JSON.parse body
      catch error
        console.log res
        console.log 'body', body
        msg.send "Ran into an error parsing JSON :("
        msg.send "```" + error.message + " ```"
        msg.send "```" + res + "```"
        return
      posts = frontpage.data.children
      post  = msg.random posts
      msg.send post.data.url
