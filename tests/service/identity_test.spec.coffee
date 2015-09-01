require('dotenv').load();
expect = require('chai').expect
ConoHa = require('../../src/conoha')

describe 'IdentityService class', ->
  
  conoha = s = null

  before (done) ->
    conoha = new ConoHa process.env.CONOHA_IDENTITY_URL,
      auth:
        passwordCredentials:
          username: process.env.CONOHA_USERNAME
          password: process.env.CONOHA_PASSWORD
        tenantId: process.env.CONOHA_TENANT_ID
    s = conoha.getService 'identity'
    done()


  describe 'request', ->
    it 'GET /', (done) ->
      s.getVersionList (err, versions) ->
        expect(err).equals null
        expect(versions).to.have.property 'values'
        done()

    it 'GET /v2.0', (done) ->
      s.getVersionDetail (err, version) ->
        expect(err).equals null
        expect(version).to.have.property 'status'
        done()
        
    it 'POST /v2.0/tokens'
