# Description:
#   Display the Imperial Date (WH40k)
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot imperial date - Display the current imperial date

Date.prototype.getYearFraction = ->
  now = new Date()
  start = new Date now.getFullYear(), 0, 0
  diff = now - start;
  oneDay = 1000 * 60 * 60 * 24
  dayOfYear = Math.floor diff / oneDay
  
  yearFraction = parseInt((dayOfYear / 365.25) * 1000 - 1)
  
  if yearFraction < 100
    yearFraction = '0' + yearFraction
    if yearFraction < 10
      yearFraction = '0' + yearFraction
  return yearFraction

Date.prototype.getImperialDate = ->
  fullYear = this.getFullYear()
  year = fullYear % 1000
  if year < 100
    year = '0' + year
  millenium = parseInt(fullYear/1000 + 1)
  return '0 ' + this.getYearFraction() + ' ' + year + '.M' + millenium

module.exports = (robot) ->
  robot.respond /imperial date/i, (msg) ->
    msg.send "By the Emperor's grace it is " + new Date().getImperialDate()
