(function() {
  var AccessToken, IdentityService;

  AccessToken = require('../access_token');

  module.exports = IdentityService = (function() {
    function IdentityService(conoha1) {
      this.conoha = conoha1;
      this.endpoint = this.conoha.identityServiceEndpoint;
    }

    IdentityService.prototype.getVersionList = function(callback) {
      return this.conoha.request.get({
        url: this.endpoint + '/',
        headers: {
          'Accept': 'application/json'
        }
      }, function(err, res, body) {
        var versions;
        versions = JSON.parse(body).versions;
        return callback(err, versions);
      });
    };

    IdentityService.prototype.getVersionDetail = function(callback) {
      return this.conoha.request.get({
        url: this.endpoint + '/v2.0',
        headers: {
          'Accept': 'application/json'
        }
      }, function(err, res, body) {
        var version;
        version = JSON.parse(body).version;
        return callback(err, version);
      });
    };

    IdentityService.prototype.postTokens = function(callback) {
      var conoha;
      conoha = this.conoha;
      return this.conoha.request.post({
        url: this.endpoint + '/v2.0/tokens',
        headers: {
          'Accept': 'application/json'
        },
        form: JSON.stringify({
          auth: this.conoha.auth
        })
      }, function(err, res, body) {
        var token;
        token = JSON.parse(body).access.token;
        conoha.token = new AccessToken(token.id, token.expires);
        return callback(err, token);
      });
    };

    return IdentityService;

  })();

}).call(this);
