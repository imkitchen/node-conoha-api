module.exports = class ConoHa
  ServiceClass = require './service'  

  # identityService: URL of IdentityService
  # auth: Object contains authenticate information
  constructor: (@identityServiceEndpoint, @auth) ->
    @request  = require 'request'
    @services = {}

  class AccessToken
    constructor: (@id, @expires) ->
    isExpired: ->
      true || false

  getService: (serviceName) ->
    @services[serviceName] ||= new ServiceClass[serviceName]?(@)
