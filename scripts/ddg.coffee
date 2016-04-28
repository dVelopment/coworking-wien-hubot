# Description:
#   Get a definition from duckduckgo.com api
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot what is (.*) - return the definition of the word/phrase

getDefinition = (msg, query) ->
  msg.http("http://api.duckduckgo.com/?q=#{query}&format=json&t=hubotscript")
    .get() (err, res, body) ->
      results = JSON.parse body
      if results.Abstract
        msg.send results.Abstract
      else
        msg.send "Sorry, I couldn't find an instant answer for #{query}"
      
module.exports = (robot) ->
  robot.respond /(what is )(.*)/i, (msg) ->
    getDefinition msg, msg.match[2]
