# Description:
#   Displays a "Doh!" GIF when necessary
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   doh! - display a "Doh!" GIF

module.exports = (robot) ->
  robot.hear /doh!/i, (msg) ->
    doh msg, robot


doh = (msg, robot) ->
    robot.http('http://api.giphy.com/v1/gifs/search?q=homer+simpson+doh&api_key=dc6zaTOxFJmzC')
        .header('Accept', 'application/json')
        .get() (err, res, body) ->
            if err
                msg.send "Encountered an error :( #{err}"
                return

            try
                frontpage = JSON.parse body
            catch error
                msg.send "Ran into an error parsing JSON :("
                msg.send "`#{error.message}`"
                return

            posts = frontpage.data
            post = msg.random posts

            msg.send post.images.original.url