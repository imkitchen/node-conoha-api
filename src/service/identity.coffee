module.exports = class IdentityService

  constructor: (@conoha) ->
    @endpoint = @conoha.identityServiceEndpoint

  # https://www.conoha.jp/docs/identity-get_version_list.html
  getVersionList: (callback) ->
    @conoha.request.get
      url: @endpoint+'/'
      headers: { 'Accept': 'application/json' }
      (err, res, body) ->
        versions = JSON.parse(body).versions
        callback(err, versions)

  # https://www.conoha.jp/docs/identity-get_version_detail.html
  getVersionDetail: (callback) ->
    @conoha.request.get
      url: @endpoint+'/v2.0'
      headers: { 'Accept': 'application/json' }
      (err, res, body) ->
        version = JSON.parse(body).version
        callback(err, version)

  # https://www.conoha.jp/docs/identity-post_tokens.html
  ###
  postTokens: (cache, callback) ->
    @conoha.request.post
      url: @endpoint+'/v2.0/tokens'
      headers: { 'Accept': 'application/json' }
      (err, res, body) ->
        token = JSON.parse(body).access?.token
        #TODO: cache to DB
        @conoha.token = new ConoHa.AccessToken(token.id, token.expires) if cache
  ###
