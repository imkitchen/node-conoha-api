(function() {
  var ServiceClass;

  module.exports = ServiceClass = {
    identity: require('./identity'),
    account: require('./account'),
    compute: require('./compute'),
    blockstorage: require('./block_storage'),
    image: require('./image'),
    network: require('./network'),
    objectstorage: require('./object_storage'),
    databasehosting: require('./database_hosting'),
    dns: require('./dns'),
    mailhosting: require('./mail_hosting')
  };

}).call(this);
