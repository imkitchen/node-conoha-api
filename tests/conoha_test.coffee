require('dotenv').load()
expect = require('chai').expect
ConoHa = require '../src/conoha'

describe 'ConoHa class', ->

  conoha = null

  before (done) ->
    conoha = new ConoHa process.env.CONOHA_IDENTITY_URL,
      auth:
        passwordCredentials:
          username: process.env.CONOHA_USERNAME
          password: process.env.CONOHA_PASSWORD
        tenantId: process.env.CONOHA_TENANT_ID
    done()


  describe 'credentials is set correctly', ->
    it 'username', ->
      expect(conoha.auth.auth.passwordCredentials.username)
      .to.not.be.undefined

    it 'password', ->
      expect(conoha.auth.auth.passwordCredentials.password)
      .to.not.be.undefined

    it 'tenant id', ->
      expect(conoha.auth.auth.tenantId)
      .to.not.be.undefined

    it 'identity service endpoint', ->
      expect(process.env.CONOHA_IDENTITY_URL)
      .to.not.be.undefined

  describe 'getService() method returns non undefined', ->
    [
      'account',
      'compute',
      'blockstorage',
      'databasehosting',
      'image',
      'dns',
      'objectstorage',
      'mailhosting',
      'identity',
      'network'
    ]
    .forEach (service) ->
      it "#{service} service", ->
        expect(conoha.getService(service)).to.not.be.undefined
