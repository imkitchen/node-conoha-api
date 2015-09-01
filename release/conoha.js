(function() {
  var ConoHa;

  module.exports = ConoHa = (function() {
    var ServiceClass;

    ServiceClass = require('./service');

    function ConoHa(identityServiceEndpoint, auth) {
      this.identityServiceEndpoint = identityServiceEndpoint;
      this.auth = auth;
      this.request = require('request');
      this.services = {};
    }

    ConoHa.prototype.getService = function(serviceName) {
      var base;
      return (base = this.services)[serviceName] || (base[serviceName] = typeof ServiceClass[serviceName] === "function" ? new ServiceClass[serviceName](this) : void 0);
    };

    return ConoHa;

  })();

}).call(this);
