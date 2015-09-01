(function() {
  var AccessToken;

  module.exports = AccessToken = (function() {
    function AccessToken(id, expires) {
      this.id = id;
      this.expires = expires;
    }

    AccessToken.prototype.isExpired = function() {
      return true || false;
    };

    return AccessToken;

  })();

}).call(this);
