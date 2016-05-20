# Description
#   A De Cesare Menu service for Hubots.
#
# Configuration:
#   None
#
# Commands:
#   hubot cesare - fetches the current De Cesare menu from the Facebook page
#
# Author:
#   tholu
#

module.exports = (robot) ->
  robot.respond /cesare\b/i, (msg) ->
    access_token = process.env.HUBOT_FACEBOOK_APP_ACCESS_TOKEN or 'SET_APP_ACCESS_TOKEN_AS_ENVIRONMENT_VARIABLE'
    url = 'https://graph.facebook.com/v2.6/199125480124588/feed?access_token=' + access_token

    robot.http(url).get() (err, res, body) ->
      switch res.statusCode
        when 200
          # parse response
          data = JSON.parse(body)
          menu = []
          m = new Date(data.data[0].created_time)
          menu.push ("0" + m.getUTCDate()).slice(-2) + "." + ("0" + (m.getUTCMonth() + 1)).slice(-2) + "."
          menu.push data.data[0].message
          msg.send menu.join(' - ')
        when 404
          msg.send "Page not found: " + url
        else
          msg.send "Unable to process your request and we're not sure why :("

