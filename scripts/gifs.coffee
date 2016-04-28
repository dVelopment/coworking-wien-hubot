# Description:
#   Picks a fitting gif from https://gifs.retzudo.com
#
# Dependencies:
#   "lodash": "^4.11.1"
#
# Commands:
#   hubot gif list - displays titles of all available gifs
#   hubot gif <title|tag> - displays a gif with matching title or tag
#
# Author:
#   Daniel Holzmann <d@velopment.at>

inspect = require('util').inspect
_ = require('lodash')

module.exports = (robot) ->
  regex = /gif (.+)/i

  robot.respond regex, (msg) ->
    processMessage msg, msg.match[1].toLowerCase()

findGif = (gifs, title) ->
  # try title first
  gif = _.find gifs, (e) ->
    return e.title.toLowerCase() == title

  if gif then return gif.url

  # first matching tag wins
  gif = _.find gifs, (e) ->
    tag = _.find e.tags, (t) ->
      return t.toLowerCase() == title

    return !!tag

  return gif && gif.url

processMessage = (msg, title) ->
  msg.http('https://gifs.retzudo.com/gifs.json')
  .get() (error, res, body) ->
    if error
      msg.reply "I got an error when talking to gifs.retzudo.com:", inspect(error)
      return

    result = JSON.parse(body)

    if title is "list"
      gifs = _.map result.gifs, (entry) ->
        return [entry.title].concat(entry.tags).join(', ')
      response = [
        "Sure, mate! Here's what I've got:",
        "```"
      ]
      .concat(gifs)
      .concat(["```"])
      .join("\n")

      msg.send response
    else
      gif = findGif result.gifs, title

      if gif
        msg.send gif
      else
        msg.send "Sorry, mate, I don't have anything matching `#{title}`."
