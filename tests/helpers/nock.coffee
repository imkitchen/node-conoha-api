global.nockback = require('nock').back
global.nockback.setMode process.env.NOCK_BACK_MODE || 'record'
global.nockback.fixtures = './tests/fixtures'
