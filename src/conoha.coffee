module.exports = class ConoHa
  @request      = require 'request'
  @ServiceClass = require './service'  

  # identityService: URL of IdentityService
  # auth: Object contains authenticate information
  constructor: (identityServiceEndpoint, @auth) ->
    @services =
      identity: new IdentityService(identityServiceEndpoint, @auth)

  class AccessToken
    constructor: (@id, @expires) ->
    isExpired: ->
      true || false

  getService: (serviceName) ->
    services[serviceName] ||= new ServiceClass[serviceName+'Service']?(@)
