module.exports = class AccessToken

  constructor: (@id, @expires) ->

  isExpired: ->
    true || false
